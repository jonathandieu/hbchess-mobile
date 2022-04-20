import 'package:flutter/material.dart';
import 'package:hb_chess/main.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:hb_chess/utils/getStats.dart';

List stats = [0, 0, 0];
List<List> games = [
  ['Red', 'Loss'],
  ['Blue', 'Tie'],
  ['Green', 'Loss'],
  ['Yellow', 'Win'],
  ['Pink', 'Win'],
  ['Orange', 'Loss'],
  ['Purple', 'Win'],
  ['Gray', 'Win'],
  ['Black', 'Win'],
  ['White', 'WIn']
];

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Dashboard'),
          ),
          drawer: Drawer(
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

          // This is the main item to edit for dashboard
          body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(children: [
              const SizedBox(height: 25),
              Text(
                'My Stats',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              const SizedBox(height: 20),
              Container(
                height: 85,
                child: Card(
                  color: const Color.fromARGB(255, 211, 211, 211),
                  child: Column(children: [
                    Row(
                      children: const <Widget>[
                        Expanded(
                          child: Text('Wins',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              textAlign: TextAlign.center),
                        ),
                        Expanded(
                          child: Text('Draws',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              textAlign: TextAlign.center),
                        ),
                        Expanded(
                          child: Text('Losses',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Expanded(
                          // wins
                          child: Text('${stats[0]}',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20),
                              textAlign: TextAlign.center),
                        ),
                        Expanded(
                          // draws
                          child: Text('${stats[1]}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              textAlign: TextAlign.center),
                        ),
                        Expanded(
                          // losses
                          child: Text('${stats[2]}',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Previous Games',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  Expanded(
                    child: Text('Team',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Text('Result',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Expanded(
                child: Card(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Card(
                              margin: const EdgeInsets.all(5),
                              color: index % 2 == 0
                                  ? Color.fromARGB(255, 173, 218, 175)
                                  : Color.fromARGB(255, 214, 224, 215),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color.fromARGB(255, 31, 41, 55),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: 80,
                                alignment: Alignment.center,
                                child: Row(
                                  children: <Widget>[
                                    // Team
                                    Expanded(
                                      child: Text('${games[index][0]}',
                                          textAlign: TextAlign.center),
                                    ),
                                    // Result
                                    Expanded(
                                      child: Text('${games[index][1]}',
                                          textAlign: TextAlign.center),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: games.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Future<String> getStats() async {
    return await getStats();
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
