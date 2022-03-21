import 'package:flutter/material.dart';
//import 'leaderboard.dart';
import 'login.dart';
import 'register.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          // allows custom image for background
          //backgroundColor: Colors.transparent,
          //backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(widget.title),
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
                      // Font not being applied
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                ),

                // Need to add routing for other ListTiles
                createDrawerTile(
                    Icons.home, 'Home', MyHomePage(title: 'HBChess')),
                //createDrawerTile(Icons.leaderboard, 'Leaderboard'),
                //createDrawerTile(Icons.book, 'Rules'),
                createDrawerTile(
                    Icons.person_add_alt_outlined, 'Sign Up', Register()),
                createDrawerTile(Icons.login, 'Login', Login()),
                //createDrawerTile(Icons.settings, 'Settings'),
              ],
            ),
          ),

          // Main home page body
          body: Center(
            child: Container(
              //color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/background.jpg"),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Play Hand Brain Chess With Friends!',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      //fontFamily: 'Poppins-Regular',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 100),
                  Wrap(
                    spacing: 100,
                    children: [
                      createbutton('Sign Up', Register()),
                      createbutton('Login', Login()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Helper function to create Drawer tiles
  // Need to add/update navigator routing once the appropriate
  // pages have been created.
  ListTile createDrawerTile(IconData icon, String title, Widget pageToShow) {
    //BuildContext context
    return ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          if (pageToShow == MyHomePage) {
            Navigator.pop(context);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pageToShow),
            );
          }
          //Navigator.pop(context);
        });
  }

  ElevatedButton createbutton(String label, Widget pageToShow) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15.0),
        textStyle: const TextStyle(fontSize: 30),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pageToShow),
        );
      },
      child: Text(label),
    );
  }
}
