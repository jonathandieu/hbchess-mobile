import 'package:hb_chess/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

const url = "https://hbchess.app/api/users/search";
//const url = "http://10.0.2.2:8080/api/users/search";

class User
{
  final String id;
  final String username;

  const User({
    required this.id,
    required this.username,
  });

  String getUser()
  {
    return username;
  }

  String getID()
  {
    return id;
  }

  factory User.fromJson(Map<User, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
    );
  }
}

Future<List<User>> search(String query) async
{
  var token = await storage.read(key: "token");
  List<User> users = [];

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
      List res = responseData['results'];
      //var test = res[0];
      //print(res[0]['username']);
      //print(test['_id']);
      for (int i = 0; i < res.length; i++)
      {
        users.add(User(id: res[i]['_id'], username: res[i]['username']));
      }
    }

  }
  catch (e)
  {
    print(e.toString());
  }
  //print(users[1].getUser());
  return users;
}