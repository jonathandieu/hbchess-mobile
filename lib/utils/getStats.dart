import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

const url = 'https://hbchess.app/';

Future<String> getStats() async {
  String ret = "";
  final queryParameters = {
    'limit': 25,
    'offset': 0,
  };
  final uri = Uri.https(url, '/api/teams/all', queryParameters);

  try {
    //http.Response response = await http.get(uri);

    http.Response response = await http.get(
      Uri.parse('https://hbchess.app/api/teams/all?limit=25&offset=0'),
    );
    if (response.statusCode == 200) {
      ret = response.body;
    } else if (response.statusCode == 400) {
      ret = "Invalid emailToken";
    } else if (response.statusCode == 404) {
      ret = "URL Not Found";
    } else {
      ret = "Invalid Credentials";
    }
  } catch (e) {
    print(e.toString());
  }
  log(ret);
  return ret;
}
