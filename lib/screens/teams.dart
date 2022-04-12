import 'package:flutter/material.dart';

class Teams extends StatefulWidget {
  const Teams({Key? key}) : super(key: key);

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Teams"),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(141, 41, 55, 100),
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size.fromHeight(50),
                  side: const BorderSide(
                    width: 1,
                    color: Color.fromARGB(31, 16, 23, 94),
                    style: BorderStyle.solid,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/addTeams');
                },
                child: const Text("Pending Invites"),
              ),
            ),
          ],
        ));
  }
}
