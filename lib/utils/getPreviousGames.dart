import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hb_chess/utils/getTeamsAPI.dart';
import 'package:hb_chess/main.dart';
import 'package:hb_chess/utils/Search.dart';

const url = 'https://hbchess.app/api/games/dashboard';

class Result {
  final Team whiteTeam;
  final Team blackTeam;
  final String winner;

  const Result({
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

  String getWinner()
  {
    return winner;
  }

  factory Result.fromJson(Map<Team, dynamic> json) {
    return Result(
          whiteTeam: 
            Team(
              id: json['_id'],
              sender: User(id: json['white']['sender']['_id'], username: json['white']['sender']['username']),
              recipient: User(id: json['white']['receiver']['_id'], username: json['white']['receiver']['username']),
              wins: json['wins'],
              draws: json['ties'],
              loss: json['losses'],
            ),
          blackTeam: 
            Team(
              id: json['_id'],
              sender: User(id: json['black']['sender']['_id'], username: json['black']['sender']['username']),
              recipient: User(id: json['black']['receiver']['_id'], username: json['black']['receiver']['username']),
              wins: json['wins'],
              draws: json['ties'],
              loss: json['losses'],
            ),
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

      //print(data[0]['black']['sender']['_id']);
      //print(data[0]['black']['sender']['username']);
      //print(data[0]['black']['wins'].length);
      //print(data);
      //print(data[0]['white']['sender']['username']);
      //print(data[0]['black']['wins']);

      for (int i = 0; i < data.length; i++)
      {
        allResults.add(
          Result(
            blackTeam: 
              Team(
                id: data[i]['black']['_id'],
                sender: User(
                  id: data[i]['black']['sender']['_id'],
                  username: data[i]['black']['sender']['username']),
                recipient: User(
                  id: data[i]['black']['recipient']['_id'],
                  username: data[i]['black']['recipient']['username']),
                wins: (data[i]['black']['wins'] ?? []) as List,
                draws: (data[i]['black']['ties'] ?? []) as List,
                loss: (data[i]['black']['loss'] ?? []) as List
                ),
            whiteTeam:
              Team(
                id: data[i]['white']['_id'],
                sender: User(
                  id: data[i]['white']['sender']['_id'],
                  username: data[i]['white']['sender']['username']),
                recipient: User(
                  id: data[i]['white']['recipient']['_id'],
                  username: data[i]['white']['recipient']['username']),
                wins: (data[i]['white']['wins'] ?? []) as List,
                draws: (data[i]['white']['ties'] ?? []) as List,
                loss: (data[i]['white']['loss'] ?? []) as List,
              ),
            winner: data[i]['result'],
        ));
       }
    }
  } catch (e) {
    print(e.toString());
  }

  return allResults;
}
