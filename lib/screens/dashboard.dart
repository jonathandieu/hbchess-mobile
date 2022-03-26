import 'package:flutter/material.dart';

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
                        color: Colors.indigo,
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
                    createDrawerTile(Icons.leaderboard, 'Leaderboard', '/leaderboard'),
                    createDrawerTile(Icons.book, 'Rules', '/rules'),
                    createDrawerTile(Icons.person, 'Teams', '/teams'),
                    createDrawerTile(Icons.settings, 'Settings', '/settings'),
                  ],
            ),
          ),
          body: const Center(
            child: Text('dashboard stuff here'),
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
