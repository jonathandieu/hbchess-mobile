import 'package:http/http.dart' as http;
import 'dart:convert';

const url = 'https://hbchess.app/api/users';

Future<String> doRegister(
    String username, String email, String password) async {
  String ret = "";
  try {
    http.Response response = await http.post(Uri.parse(url + '/register'),
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
        }),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 201) {
      //ret = "Account Successfully Created";
      try {
        http.Response response2 = await http.get(
          Uri.parse(url + '/verify-user'),
        );
        if (response2.statusCode == 200) {
          ret = "Account Successfully Created";
        } else if (response2.statusCode == 400) {
          ret = "Invalid emailToken";
        }
      } catch (e) {
        print(e.toString());
      }
    } else if (response.statusCode == 400) {
      ret = "Invalid user data";
    } else if (response.statusCode == 404) {
      ret = "URL Not Found";
    } else if (response.statusCode == 409) {
      ret = "Username or email already exists";
    } else {
      ret = "Invalid Credentials";
    }
  } catch (e) {
    print(e.toString());
  }
  return ret;
}
