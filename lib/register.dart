import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Text('Welcome to Hand Brain Chess!',
                    style:
                        TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text('Create your account today!',
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
            ),
            createInputField(false, "Username", Icons.person),
            createInputField(false, "E-Mail", Icons.email),
            createInputField(true, "Password", Icons.lock),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    textStyle: const TextStyle(fontSize: 20),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {}, //FIXME: Connect to register endpoint
                  child: const Text('Sign Up'),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align createInputField(bool showText, String placeholder, IconData icon) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: TextField(
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

/*

*/