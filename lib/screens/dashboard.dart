import 'package:flutter/material.dart';
import 'package:hb_chess/main.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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
            child: Column(
              children: <Widget>[
                // 1st item
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'My Stats',
                    style: TextStyle(fontSize: 35),
                    textAlign: TextAlign.center,
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 500,
                    maxWidth: 500,
                    //width: 500,
                  ),
                  child: Card(
                    color: const Color.fromARGB(255, 211, 211, 211),
                    child: Row(
                      children: const <Widget>[
                        Expanded(
                          child: Text('Wins', textAlign: TextAlign.center),
                        ),
                        // Team
                        Expanded(
                          child: Text('Draw', textAlign: TextAlign.center),
                        ),
                        // Rank
                        Expanded(
                          child: Text('Loss', textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
