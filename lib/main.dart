import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '/splash.dart';
import '/routes.dart';

final storage = FlutterSecureStorage();

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
      routes: Routes.getRoutes,
      // Starts application with splash screen
      home: const Splash(),
    );
  }
}
