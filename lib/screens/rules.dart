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
        child: Column(children: [
          const SizedBox(height: 25),
          Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Text(
                    'How to Play',
                    style: TextStyle(fontSize: 40),
                  ),
                  const SizedBox(height: 25),

                  // There is probably a better way to add this text. Look into file imports
                  const Text(
                    "Hand and Brain chess is a chess variant intended to play in pairs. One player will be the brain, and the other is the hand. The brain calls out a piece, and the hand chooses how and where to move that piece. Normal chess rules still apply. Tap a card below to learn more about each role.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),

                  // space between headers
                  /*const SizedBox(height: 60),
                  const Text(
                    'Description of Roles',
                    style: TextStyle(fontSize: 40),
                  ),
                  */
                  const SizedBox(height: 25),
                  // Hand rule card
                  Card(
                    margin: const EdgeInsets.all(5),
                    color: const Color.fromARGB(255, 31, 41, 55),
                    child: InkWell(
                      splashColor: Colors.white.withAlpha(50),
                      onTap: () {
                        //Navigator.pop(context);
                        _showHandRules(context);
                      },
                      child: Container(
                        height: 150,
                        width: 325,
                        alignment: Alignment.center,
                        child: const Text(
                          'The Hand',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Brain rule card
                  Card(
                    margin: const EdgeInsets.all(5),
                    color: const Color.fromARGB(255, 31, 41, 55),
                    child: InkWell(
                      splashColor: Colors.white.withAlpha(50),
                      onTap: () {
                        //Navigator.pop(context);
                        _showBrainRules(context);
                      },
                      child: Container(
                        height: 150,
                        width: 325,
                        alignment: Alignment.center,
                        child: const Text(
                          'The Brain',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ]),
        //child: Text('rules page'),
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
        return Expanded(
          child: SimpleDialog(
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
                    'The brain has the role of choosing which piece the hand player has to choose from. The brain can call out any piece as long as it has a legal move. They CANNOT hint the moves they would like a piece to make. That decision is completely up to the hand.',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

_showHandRules(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: SimpleDialog(
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
          ),
        );
      });
}
