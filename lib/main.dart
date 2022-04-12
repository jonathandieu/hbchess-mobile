import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '/splash.dart';
import '/routes.dart';

final storage = FlutterSecureStorage();

Map<int, Color> color = {
  50: const Color.fromARGB(31, 41, 55, 100),
  100: const Color.fromARGB(31, 41, 55, 100),
  200: const Color.fromARGB(31, 41, 55, 100),
  300: const Color.fromARGB(31, 41, 55, 100),
  400: const Color.fromARGB(31, 41, 55, 100),
  500: const Color.fromARGB(31, 41, 55, 100),
  600: const Color.fromARGB(31, 41, 55, 100),
  700: const Color.fromARGB(31, 41, 55, 100),
  800: const Color.fromARGB(31, 41, 55, 100),
  900: const Color.fromARGB(31, 41, 55, 100),
};

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
        primarySwatch: MaterialColor(0xFF1f2937, color),
      ),
      routes: Routes.getRoutes,
      // Starts application with splash screen
      home: const Splash(),
    );
  }
}
