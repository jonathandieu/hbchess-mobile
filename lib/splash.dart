import 'package:flutter/material.dart';
import 'package:hb_chess/main.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  // Splash screen to homepage
  _navigatetohome() async {
    String? userToken = await storage.read(key: "token");

    const waitSplash = Duration(milliseconds: 1500);
    await Future.delayed(waitSplash, () {});

      if (userToken != null)
      {
        bool hasExpired = JwtDecoder.isExpired(userToken);
        if (!hasExpired)
        {
          Navigator.pushNamed(context, '/dashboard');
        }
        else
        {
          Navigator.pushNamed(context, '/home');
        }
      }
      else
      {
       Navigator.pushNamed(context, '/home');
      }
  }

  // Contents for the splash screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 225,
            maxWidth: 225,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(71, 63, 81, 181),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(5.0, 5.0),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
            ],
            color: Colors.white,
          ),
          child: const Center(
            child: Text(
              'HBChess',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
