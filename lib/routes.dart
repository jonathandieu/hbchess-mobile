import 'package:flutter/material.dart';
import 'package:hb_chess/screens/home.dart';
import 'package:hb_chess/screens/login.dart';
import 'package:hb_chess/screens/register.dart';
import 'package:hb_chess/screens/leaderboard.dart';
import 'package:hb_chess/screens/dashboard.dart';

class Routes {
  static const String homeScreen = '/home';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String leaderboard = '/leaderboard';
  static const String dashboard = '/dashboard';

  static Map<String, Widget Function(BuildContext)> get getRoutes => {
    homeScreen: (context) => const MyHomePage(title: 'HBChess'),
    loginScreen: (context) => const Login(),
    registerScreen: (context) => const Register(),
    leaderboard: (context) => const Leaderboard(),
    dashboard: (context) => const Dashboard(),
  };
}