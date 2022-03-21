import 'package:http/http.dart' as http;
import 'dart:convert';

const URL = 'https://hbchess.app/api/users';
//const USER_COLLECTIONS = ""; // Collection name

//const URL = 'https://cop4331-10.herokuapp.com/api/login';

class CardsData {
  static Future<String> getJson(String outgoing) async
  {
    String ret = "";
    try
    {
      http.Response response = await http.post(Uri.parse(URL),
          body: utf8.encode(outgoing),
          headers:
          {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
          encoding: Encoding.getByName("utf-8")
      );
      ret = response.body;
    }
    catch (e)
    {
      print(e.toString());
    }
    return ret;
  }
}