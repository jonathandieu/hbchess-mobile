import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hb_chess/utils/getTeamsAPI.dart';
import 'package:hb_chess/main.dart';
import 'package:hb_chess/utils/Search.dart';

const url = 'https://hbchess.app/api/games/dashboard';

class Result {
  final String id;
  final Team whiteTeam;
  final Team blackTeam;
  final String winner;

  const Result({
    required this.id,
    required this.whiteTeam,
    required this.blackTeam,
    required this.winner,
  });

  String getBlackSenderUser() {
    return blackTeam.sender.getUser();
  }

  String getBlackRecipientUser() {
    return blackTeam.recipient.getUser();
  }

  String getWhiteSenderUser() {
    return whiteTeam.sender.getUser();
  }

  String getWhiteRecipientUser() {
    return whiteTeam.recipient.getUser();
  }

  factory Result.fromJson(Map<Team, dynamic> json) {
    return Result(
      id: json['_id'],
      whiteTeam: json['white'],
      blackTeam: json['black'],
      winner: json['winner'],
    );
  }
}

Future<List<Result>> getPreviousGames() async {
  List<Result> allResults = [];
  var token = await storage.read(key: "token");

  try {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for (int i = 0; i < data.length; i++) {
        allResults.add(Result(
          id: data[i]['_id'],
          whiteTeam: data[i]['white'],
          blackTeam: data[i]['black'],
          winner: data[i]['winner'],
        ));
      }
    }
  } catch (e) {
    print(e.toString());
  }
  return allResults;
}
