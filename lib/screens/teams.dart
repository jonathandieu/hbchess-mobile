
import 'package:flutter/material.dart';
import 'package:hb_chess/main.dart';
import 'package:hb_chess/utils/getTeamsAPI.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:hb_chess/utils/Search.dart';
import 'package:http/http.dart';

late List<Team> teams = [];
String name = '';

getUserName() async {
  var token = await storage.read(key: "token");
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
  name = decodedToken['username'];
}
// need to add lazy loading for Teams entries
class Teams extends StatefulWidget {
  const Teams({Key? key}) : super(key: key);
  @override
  State<Teams> createState() => _TeamsState();
}


class _TeamsState extends State<Teams> {
  String teammate = '';

  @override
  Widget build(BuildContext context) {

    getAcceptedTeams();
    getUserName();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Teams"),
      ),
      body: Column(
        children: [
          // Teams header
          ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 100,
              maxWidth: 500,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(141, 41, 55, 100),
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size.fromHeight(50),
                  side: const BorderSide(
                    width: 1,
                    color: Color.fromARGB(31, 16, 23, 94),
                    style: BorderStyle.solid,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/addTeams');
                },
                child: const Text("Add and Accept Invites"),
              ),
            ),
          ),

          // Scrollable list
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Card(
                        margin: const EdgeInsets.all(5),
                        color: index % 2 == 0
                          ? const Color.fromARGB(218, 241, 241, 241)
                          : const Color.fromARGB(255, 187, 187, 187),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Color.fromARGB(255, 31, 41, 55),
                              width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        child: Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: Row(
                            children: <Widget>[
                              // Name
                              Expanded(
                                child: Text(checkNames(index),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      ),
                                  ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: teams.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Grab your teammates
  getAcceptedTeams() async {
    Future<List<Team>> res = getTeams();
    teams = await res;
    if (mounted) setState((){});
  }

  String checkNames(int index) {
    if (teams[index].getRecipientUser().toLowerCase() == name.toLowerCase())
    {
      return teams[index].getSenderUser();
    }
    else
    {
      return teams[index].getRecipientUser();
    }
  }
}

createPlayerCard(String team, String rank) {
  return Card(
    margin: const EdgeInsets.all(8.0),
    elevation: 5.0,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
              fit: FlexFit.tight,
              child: Text(
                team,
                style: const TextStyle(fontSize: 18),
              )),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Text(
              rank,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}