import 'package:flutter/material.dart';
import 'package:hb_chess/leaderboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Text('Welcome Back',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold)),

              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Padding (
                padding: EdgeInsets.only(bottom:20),
                child:
                  Text('Sign in here',
                    style: TextStyle(
                      fontSize: 20,
                )),
              ),
            ),
            createInputField(false, "Username", Icons.person),
            createInputField(true, "Password", Icons.lock),
            Align(
              alignment: Alignment.center,
              child: Padding (
                padding: const EdgeInsets.only(left:40, right:40, top:30),
                child:
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      textStyle: const TextStyle(fontSize: 20),
                      minimumSize: const Size.fromHeight(50),
                    ),
                  onPressed: () {}, //FIXME: Actually put in logging in stuff
                  child: const Text('Log In'),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Align createInputField(bool showText, String placeholder, IconData icon) {
    return Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left:40, right:40),
              child:
                TextField(
                  obscureText: showText,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: placeholder,
                    prefixIcon: Icon(icon),
                  ),
                ),
            ),
          );
  }
}