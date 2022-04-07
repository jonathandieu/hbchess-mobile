import 'package:flutter/material.dart';

// Dummy leaderboard entries
final List<String> playerRankings = <String>['A', 'B', 'C'];

List<List> teams = [
  ['Red', 'A'],
  ['Blue', 'B'],
  ['Green', 'A'],
  ['Yellow', 'C'],
  ['Pink', 'C'],
  ['Orange', 'B'],
  ['Purple', 'B'],
  ['Gray', 'C'],
  ['Black', 'D'],
  ['White', 'D']
];

// need to add lazy loading for leaderboard entries
class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leaderboard"),
      ),
      body: Stack(
        children: <Widget>[
          Column(),
          ListView.separated(
            padding: const EdgeInsets.all(25),
            itemCount: playerRankings.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Color.fromARGB(255, 200, 225, 236),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '# ${index + 1} - ${playerRankings[index]}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
        centerTitle: true,
        title: const Text("Leaderboard"),
      ),
      body: Column(
        children: [
          // Leaderboard header
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 100,
              maxWidth: 500,
            ),
            child: Container(
              color: Color.fromARGB(255, 211, 211, 211),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text('#', textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Text('Team', textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Text('Rank', textAlign: TextAlign.center),
                  ),
                ],
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
                              // #
                              Expanded(
                                child: Text('${index + 1}',
                                    textAlign: TextAlign.center),
                              ),
                              // Team
                              Expanded(
                                child: Text('${teams[index][0]}',
                                    textAlign: TextAlign.center),
                              ),
                              // Rank
                              Expanded(
                                child: Text('${teams[index][1]}',
                                    textAlign: TextAlign.center),
                              ),
                              /*
                        */
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
}

<<<<<<< re-organization
//createListTile(String player) {}
=======
// FIXME: Update once rankings are available
List<List> getPlayers() {
  return teams;
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
