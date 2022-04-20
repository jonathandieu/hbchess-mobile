import 'package:hb_chess/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

const url = "https://hbchess.app/api/users/search";
//const url = "http://10.0.2.2:8080/api/users/search";

Future<List> search(String query) async
{
  var token = await storage.read(key: "token");
  List users = [];

  try
  {
    http.Response response = await http.get(Uri.parse(url + "?search=" + query),
      headers:
      {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    
    );

    if (response.statusCode == 200)
    {
      var responseData = json.decode(response.body);
      users = responseData["results"];
    }

  }
  catch (e)
  {
    print(e.toString());
  }

  return users;
}