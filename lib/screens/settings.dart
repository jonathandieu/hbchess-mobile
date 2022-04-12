import 'package:flutter/material.dart';
import 'package:hb_chess/main.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 211, 81, 71),
                textStyle: const TextStyle(fontSize: 30),
                minimumSize: const Size.fromHeight(50),
                side: const BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 16, 23, 94),
                  style: BorderStyle.solid,
                ),
              ),
              onPressed: () async {
                await storage.deleteAll();
                Navigator.pushNamed(context, '/home');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("You have logged out")),
                );
              },
              child: const Text("Logout"),
            )),
      ),
    );
  }
}
