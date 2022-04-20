import 'package:hb_chess/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

const url = 'https://hbchess.app/api/teams';
//const url = 'http://10.0.2.2:8080/api/teams';

class Partner {
  String id;
  String username;

  Partner(this.id, this.username);

  //   factory Partner.fromJson(Map<String, dynamic> json) {
  //   return Partner(
  //     json['team']['_id'].toString(),
  //     json['team']['recipientUsername'].toString()
  //   );
  // }
}

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