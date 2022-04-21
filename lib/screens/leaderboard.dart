import 'package:flutter/material.dart';
import 'package:hb_chess/main.dart';

// Dummy data to test leaderboard page
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
  List<List> players = getPlayers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Leaderboard"),
      ),

      // Shared Drawer Menu
      /*
      drawer: Drawer(
        child: SizedBox(
          height: 2000,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 31, 41, 55),
                ),
                child: Text(
                  'HBChess',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ),
              createDrawerTile(Icons.home, 'Dashboard', '/dashboard'),
              createDrawerTile(
                  Icons.leaderboard, 'Leaderboard', '/leaderboard'),
              createDrawerTile(Icons.book, 'Rules', '/rules'),
              createDrawerTile(Icons.person, 'Teams', '/teams'),
              createDrawerTile(Icons.settings, 'Settings', '/settings'),
            ],
          ),
        ),
      ),
      */
      body: Column(
        children: [
          // Leaderboard header
          ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 100,
              maxWidth: 500,
            ),
            child: Container(
              color: const Color.fromARGB(255, 211, 211, 211),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text('#', textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Text('Team', textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Text('Score', textAlign: TextAlign.center),
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
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: index == 0
                                  ? Colors.amber
                                  : index == 1
                                      ? Color.fromARGB(255, 173, 173, 173)
                                      : index == 2
                                          ? Colors.brown
                                          : Color.fromARGB(255, 31, 41, 55),
                              width: index == 0
                                  ? 5
                                  : index == 1
                                      ? 4
                                      : index == 2
                                          ? 3
                                          : 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: Row(
                            children: <Widget>[
                              // #
                              Expanded(
                                child: Text(
                                  '${index + 1}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              // Team
                              Expanded(
                                child: Text(
                                  ranks[index].getSenderUser() +
                                      ' - ' +
                                      ranks[index].getRecipientUser(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              // Rank
                              Expanded(
                                child: Text(
                                  '${ranks[index].wins.length} - ${ranks[index].draws.length} - ${ranks[index].loss.length}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: ranks.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile createDrawerTile(IconData icon, String title, String route) {
    //BuildContext context
    return ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          Navigator.pushNamed(context, route);
        });
  }
}

// FIXME: Update once rankings are available
List<List> getPlayers() {
  return teams;
}

/*
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
*/