import 'package:flutter/material.dart';
import 'package:hb_chess/main.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

List stats = [0, 0, 0];

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
            child: Column(children: <Widget>[
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
              const SizedBox(height: 20),
              Text(
                'Previous Games',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              const SizedBox(height: 20),

              /*
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
                        child: Text('Team', textAlign: TextAlign.center),
                      ),
                      Expanded(
                        child: Text('Result', textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                ),
              ),
              */
            ]),
          ),
        ),
      ],
    );
  }

  //FIXME: Update once stats are available
  List getStats() {
    return stats;
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
