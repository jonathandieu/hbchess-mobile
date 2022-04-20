
import 'package:flutter/material.dart';

// Dummy data to test Teams page
List<List> partners = [
  ['Red'],
  ['sfgd'],
  ['dfgdfgn'],
];

// need to add lazy loading for Teams entries
class Teams extends StatefulWidget {
  const Teams({Key? key}) : super(key: key);

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  List<List> players = getPartners();

  @override
  Widget build(BuildContext context) {
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
                        child: Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: Row(
                            children: <Widget>[
                              // Name
                              Expanded(
                                child: Text('${partners[index][0]}',
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: partners.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Grab your teammates
List<List> getPartners() {
  
  return partners;
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