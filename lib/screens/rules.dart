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
                  const SizedBox(height: 30),

                  // There is probably a better way to add this text. Look into file imports
                  const Text(
                    "Teams are made up of two players. One player will be the brain and the other is the hand. The brain will call out the name of a piece, and the hand has to decide which of those pieces to move and where they want to move that piece to. Teammates cannot communicate where they want a piece to go. Otherwise normal chess rules apply.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Roles',
                    style: TextStyle(fontSize: 40),
                  ),
                  const SizedBox(height: 25),
                  // Hand rule card
                  Card(
                    margin: const EdgeInsets.all(5),
                    color: Colors.indigo,
                    child: InkWell(
                      splashColor: Colors.white.withAlpha(50),
                      onTap: () {
                        //Navigator.pop(context);
                        _showHandRules(context);
                      },
                      child: Container(
                        height: 100,
                        width: 325,
                        alignment: Alignment.center,
                        child: const Text(
                          'The Hand',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Brain rule card
                  Card(
                    margin: const EdgeInsets.all(5),
                    color: Colors.indigo,
                    child: InkWell(
                      splashColor: Colors.white.withAlpha(50),
                      onTap: () {
                        //Navigator.pop(context);
                        _showBrainRules(context);
                      },
                      child: Container(
                        height: 100,
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
                child: const Text('The Brain rules will go here'),
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
                child: const Text('The Hand rules will go here'),
              ),
            ],
          ),
        );
      });
}
