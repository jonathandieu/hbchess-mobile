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
      body: Center(
        child: Expanded(
          child: ListView(
            children: [
              const SizedBox(height: 25),
              const Text(
                'How to Play',
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),

              // Rule 1:
              Container(
                child: Image.asset(
                  "assets/images/rules1.png",
                  fit: BoxFit.fitHeight,
                ),
                height: 300,
                width: 300,
              ),
              const Text(
                'Hand and Brain chess is a chess variant intended to play in pairs.',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),

              // Rule 2:
              Container(
                child: Image.asset(
                  "assets/images/rules2.png",
                  fit: BoxFit.fitHeight,
                ),
                height: 350,
                width: 350,
              ),
              const Text(
                'One player will be the brain, and the other is the hand. The brain calls out a piece, and the hand chooses how and where to move that piece.',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),

              // Rule 3:
              Container(
                child: Image.asset(
                  "assets/images/rules3.png",
                  fit: BoxFit.fitHeight,
                ),
                height: 250,
                width: 250,
              ),
              const Text(
                'The brain CANNOT hint the moves they would like a piece to make. That decision is completely up to the hand. All normal chess rules still apply.',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
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
      ),
    );
  }
}

Future<String> getTextData(String path) async {
  return await rootBundle.loadString(path);
}

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
