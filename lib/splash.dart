import 'package:flutter/material.dart';
import 'package:hb_chess/main.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    _navigatetohome();
  }

  // Splash screen to homepage
  _navigatetohome() async {
    const waitSplash = Duration(milliseconds: 1500);
    const title = 'HBChess';
    await Future.delayed(waitSplash, () {});

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(title: title),
      ),
    );
  }

  // Contents for the splash screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Container(
          child: Text(
            'HBChess',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
