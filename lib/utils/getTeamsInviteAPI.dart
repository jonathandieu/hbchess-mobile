import 'package:hb_chess/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hb_chess/utils/Search.dart';

const url = 'https://hbchess.app/api/teams';

class PendingTeam
{
  final String id;
  final User sender;

  const PendingTeam({
    required this.id,
    required this.sender,
  });

  String getSenderUser()
  {
    return sender.getUser();
  }

  factory PendingTeam.fromJson(Map<PendingTeam, dynamic> json) {
    return PendingTeam(
      id: json['_id'],
      sender: User(id: json['sender']['_id'], username: json['sender']['username']),
    );
  }

}

Future<List<PendingTeam>> getPendingTeams() async
{
  var token = await storage.read(key: "token");

  List<PendingTeam> pendingTeams = [];

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
      List res = responseData['teamNot'];
      for (int i = 0; i < res.length; i++)
      {
        pendingTeams.add(PendingTeam(id: res[i]['_id'],
        sender: User(id: res[i]['sender']['_id'], username: res[i]['sender']['username'])),
        );
      }
    }

  }
  catch (e)
  {
    print(e.toString());
  }
  //print(pendingTeams[0].getSenderUser());
  return pendingTeams;
}

Future acceptInvite(String user) async
{
  var token = await storage.read(key: "token");

  try
  {

      http.Response response = await http.put(Uri.parse(url + '/accept'),
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
  }
  catch (e)
  {
    print(e.toString());
  }


}