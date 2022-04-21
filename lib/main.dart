import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hb_chess/utils/getPreviousGames.dart';
import '/splash.dart';
import '/routes.dart';
import 'package:hb_chess/utils/getLeaderboard.dart';
import 'package:hb_chess/utils/getTeamsAPI.dart';

final storage = FlutterSecureStorage();
List<Team> ranks = [];
List<Result> results = [];

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

_getCurrentRanks() async {
  Future<List<Team>> res = getLeaderboard();
  ranks = await res;
}

_getPreviousGames() async {
  Future<List<Result>> res = getPreviousGames();
  results = await res;
}

void main() {
  _getCurrentRanks();
  _getPreviousGames();
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
