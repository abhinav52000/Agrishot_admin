import 'package:agrishot_admin/Network/Login_api/get_set_acceess_token.dart';
import 'package:flutter/material.dart';

import '../UI_components/login_big_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const id = "Login Screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    _loadMyValue();
  }

  _loadMyValue() {
    setState(() {
      loadMyValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: width > 600
          // in case screen size is large
          ? const LoginBigScreen()
          :
          // In case screen size is small
          Container(),
    );
  }
}
