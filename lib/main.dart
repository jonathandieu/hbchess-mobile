import 'package:flutter/material.dart';
import 'splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HB Chess Home',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // Starts application with splash screen
      home: Splash(),
    );
  }
}
