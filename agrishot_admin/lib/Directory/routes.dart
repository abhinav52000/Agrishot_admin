import 'package:flutter/material.dart';
import '../screen/Home_screen.dart';
import '../screen/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.id:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case HomeScreen.id:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    // case BookMarkScreen.id:
    //   final deviceId = settings.arguments as String;
    //   return MaterialPageRoute(
    //     builder: (context) => BookMarkScreen(
    //       deviceId: deviceId,
    //     ),
    //   );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Text('This page doesn\'t exist'),
        ),
      );
  }
}
