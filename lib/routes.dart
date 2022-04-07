import 'package:flutter/material.dart';
import 'package:hb_chess/screens/home.dart';
import 'package:hb_chess/screens/login.dart';
import 'package:hb_chess/screens/register.dart';
import 'package:hb_chess/screens/leaderboard.dart';
import 'package:hb_chess/screens/dashboard.dart';
import 'package:hb_chess/screens/rules.dart';
import 'package:hb_chess/screens/teams.dart';
import 'package:hb_chess/screens/settings.dart';
import 'package:hb_chess/screens/teams_add.dart';

class Routes {
  static const String homeScreen = '/home';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String leaderboard = '/leaderboard';
  static const String dashboard = '/dashboard';
  static const String rules = '/rules';
  static const String teams = '/teams';
  static const String settings = '/settings';
  static const String teamsAdd = '/addTeams';

  static Map<String, Widget Function(BuildContext)> get getRoutes => {
    homeScreen: (context) => const MyHomePage(title: 'HBChess'),
    loginScreen: (context) => const Login(),
    registerScreen: (context) => const Register(),
    leaderboard: (context) => const Leaderboard(),
    dashboard: (context) => const Dashboard(),
    rules: (context) => const Rules(),
    teams: (context) => const Teams(),
    settings: (context) => const Settings(),
    teamsAdd: (context) => const TeamsAdd(),
  };
}