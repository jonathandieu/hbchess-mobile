import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hb_chess/utils/getTeamsAPI.dart';
import 'package:hb_chess/main.dart';
import 'package:hb_chess/utils/Search.dart';

const url = 'https://hbchess.app/api/teams/all?limit=10&offset=0';

Future<List<Team>> getLeaderboard() async
{
  List<Team> allTeams = [];

  try
  {
    http.Response response = await http.get(Uri.parse(url),
    headers:
        {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
    );

    // print(response.statusCode);
    // var responseData = json.decode(response.body);
    // print(responseData[0]["matches"].length);
    if (response.statusCode == 200)
    {
      var data = json.decode(response.body);
      for (int i = 0; i < data.length; i++)
      {
        allTeams.add(
          Team(
            id: data[i]['_id'],
            sender: User(id: data[i]['sender']['_id'], username: data[i]['sender']['username']),
            recipient: User(id: data[i]['recipient']['_id'], username: data[i]['recipient']['username']),
            wins: data[i]['wins'],
            draws: data[i]['ties'],
            loss: data[i]['losses']
          )
        );
      }
    }
  }
  catch (e)
  {
    print(e.toString());
  }

  //print(allTeams[0].getRecipientUser());
  return allTeams;
}