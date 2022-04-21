import 'package:flutter/material.dart';
import 'package:hb_chess/main.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _oldpass = TextEditingController();
  final TextEditingController _newpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: 
        Column(
            children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       onPrimary: Colors.black,
                //       primary: Color.fromARGB(255, 212, 212, 212),
                //       textStyle: const TextStyle(fontSize: 25),
                //       minimumSize: const Size.fromHeight(50),
                //       side: const BorderSide(
                //         width: 1,
                //         color: Color.fromARGB(255, 16, 23, 94),
                //         style: BorderStyle.solid,
                //       ),
                //     ),
                //     onPressed: () {
                //       //resetField(_username, _oldpass, _newpass);
                //     },
                //     child: const Text("Reset Password"),
                //   ),
                // ),
              Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 211, 81, 71),
                      textStyle: const TextStyle(fontSize: 25),
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
                  ),
                ),
            ],
        ),
    );
  }

  // resetField(TextEditingController username, TextEditingController oldPass, TextEditingController newPass)
  // {
  //   showDialog(context: context, builder: (context)
  //   {
  //     return AlertDialog(
  //       title: const Text("Reset your password"),
  //       content: TextField(
  //         controller: username,
  //         decoration: InputDecoration(hintText: "Text Field in Dialog"),
  //       ),
  //       actions: <Widget>[
  //         OutlinedButton(
  //           onPressed: () => Navigator.of(context).pop(),
  //           child: const Text('Cancel')
  //         ),
  //         TextButton(
  //           onPressed: () {

  //           },
  //           child: const Text('Save'),
  //           style: TextButton.styleFrom(
  //             backgroundColor: const Color.fromARGB(255, 128, 150, 182),
  //             primary: Colors.white,
  //           ),
  //         ),
  //       ],
  //     );
  //   }
  // );
  // }

}
