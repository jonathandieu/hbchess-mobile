import 'package:hb_chess/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hb_chess/utils/Search.dart';

const url = 'https://hbchess.app/api/teams';
//const url = 'http://10.0.2.2:8080/api/teams';

class Team
{
  final String id;
  final User sender;
  final User recipient;
  final List wins;
  final List draws;
  final List loss;

  const Team({
    required this.id,
    required this.sender,
    required this.recipient,
    required this.wins,
    required this.draws,
    required this.loss,
  });

  String getSenderUser()
  {
    return sender.getUser();
  }

  String getRecipientUser()
  {
    return recipient.getUser();
  }

  factory Team.fromJson(Map<Team, dynamic> json) {
    return Team(
      id: json['_id'],
      sender: User(id: json['sender']['_id'], username: json['sender']['username']),
      recipient: User(id: json['recipient']['_id'], username: json['recipient']['username']),
      wins: json['wins'],
      draws: json['ties'],
      loss: json['losses'],
    );
  }

}

Future<List<Team>> getTeams() async
{
  var token = await storage.read(key: "token");

  List<Team> teams = [];

  try
  {
    http.Response response = await http.get(Uri.parse(url + '/get'),
    headers:
        {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },

    );

    var responseData = json.decode(response.body);

  if (response.statusCode == 200)
    {
      //List test = [1,2];
      //print(test);
      List res = responseData['team'];
      for (int i = 0; i < res.length; i++)
      {
        teams.add(Team(id: res[i]['_id'],
        sender: User(id: res[i]['sender']['_id'], username: res[i]['sender']['username']),
        recipient: User(id: res[i]['recipient']['_id'], username: res[i]['recipient']['username']),
        wins: res[i]['wins'],
        draws: res[i]['ties'],
        loss: res[i]['losses']
        
        )
        );
      }
    }

  }
  catch (e)
  {
    print(e.toString());
  }
  //print(teams[0].getRecipientUser());
  return teams;
}

Future<String> createTeam(String user) async
{
  String ret = '';
  var token = await storage.read(key: "token");

  try
  {
    http.Response response = await http.post(Uri.parse(url + '/create'),
        body: jsonEncode({
          "username": user,
        }),
        headers:
        {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        encoding: Encoding.getByName("utf-8")
    );

    if (response.statusCode == 201)
    {
      var responseData = json.decode(response.body);
      ret = responseData['message'];
    }
    else if (response.statusCode == 400)
    {
      ret = "Invalid user data";
    }
    else if (response.statusCode == 404)
    {
      ret = "Username doesn't exist";
    }
    else if (response.statusCode == 409)
    {
      ret = "Team request still pending";
    }
  }
  catch (e)
  {
    print(e.toString());
  }

  return ret;
}