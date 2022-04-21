import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Rules extends StatefulWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  State<Rules> createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rules"),
      ),
      /*
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
            createDrawerTile(Icons.leaderboard, 'Leaderboard', '/leaderboard'),
            createDrawerTile(Icons.book, 'Rules', '/rules'),
            createDrawerTile(Icons.person, 'Teams', '/teams'),
            createDrawerTile(Icons.settings, 'Settings', '/settings'),
          ],
        ),
      ),
      */
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 25),
            SizedBox(
              width: 10,
              height: 70,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.green, width: 3),
                ),
                child: const Text(
                  'How to Play',
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Rule 1:
            SizedBox(
              child: Image.asset(
                "assets/images/rules1.png",
                fit: BoxFit.fitHeight,
              ),
              height: 300,
              width: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                '#1: Hand and Brain chess is a chess variant intended to play in pairs.',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 25),

            // Rule 2:
            SizedBox(
              child: Image.asset(
                "assets/images/rules2.png",
                fit: BoxFit.fitHeight,
              ),
              height: 350,
              width: 350,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                '#2: One player will be the brain, and the other is the hand.\n\n#3: The brain calls out a piece, and the hand chooses how and where to move that piece.',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 25),

            // Rule 3:
            SizedBox(
              child: Image.asset(
                "assets/images/rules3.png",
                fit: BoxFit.fitHeight,
              ),
              height: 250,
              width: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                '#4: The brain CANNOT hint the moves they would like a piece to make. That choice is completely up to the hand. \n\n#5: All normal chess rules still apply.',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ),

            const SizedBox(height: 50),
            /*
              const Text(
                'Tap a card below to learn more about each role.',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              */
          ],
        ),
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

Future<String> getTextData(String path) async {
  return await rootBundle.loadString(path);
}

// These functions are currently unused. They create dialog boxes for each role.
/*
_showBrainRules(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: [
            // Dialog box that pops up after button press
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                //height: 250,
                width: 325,
                alignment: Alignment.center,
                child: const Text(
                  'The brain has the role of choosing which piece the hand player has to choose from. The brain can call out any piece as long as it has a legal move. They CANNOT hint the moves they would like a piece to make. That decision is completely up to the hand.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        );
      });
}

_showHandRules(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: [
            // Dialog box that pops up after button press
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 250,
                width: 325,
                alignment: Alignment.center,
                child: const Text(
                  'The hand has the role of choosing which piece to move depending on what the brain has decided to call out. The hand should only move pieces that are called by the brain even if the only possible moves are bad.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        );
      });
}
*/
