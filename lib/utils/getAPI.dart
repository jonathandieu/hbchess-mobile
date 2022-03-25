import 'package:http/http.dart' as http;
import 'dart:convert';

const url = 'https://hbchess.app/api/users';

Future<String> doLogin(String email, String password) async
{
  String ret = "";
  try
  {
    http.Response response = await http.post(Uri.parse(url + '/login'),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers:
        {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        encoding: Encoding.getByName("utf-8")
    );

    if (response.statusCode == 200)
    {
      ret = response.body;
    }
  }
  catch (e)
  {
    print(e.toString());
  }
  return ret;
}