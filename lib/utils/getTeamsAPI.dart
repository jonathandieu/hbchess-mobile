import 'package:hb_chess/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

const url = 'https://hbchess.app/api/teams';
//const url = 'http://10.0.2.2:8080/api/teams';

Future<List> getTeams() async
{
  var token = await storage.read(key: "token");

  print("reached function");
  //List<Partner> partners = []; 
  List teams = [];

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
    print("made request");
    print(response.statusCode);

    var responseData = json.decode(response.body);

    if (response.statusCode == 400)
    {
      print("no email token");
    }
    else if (response.statusCode == 200)
    {
      //List test = [1,2];
      //print(test);
      print(responseData['team']);
    }

  }
  catch (e)
  {
    print(e.toString());
  }

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