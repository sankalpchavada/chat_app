import 'package:firebase_miner/pages/login.dart';
import 'package:firebase_miner/pages/register.dart';
import 'package:flutter/material.dart';

class LoginOrRegsiter extends StatefulWidget {
  const LoginOrRegsiter({super.key});

  @override
  State<LoginOrRegsiter> createState() => _LoginOrRegsiterState();
}

class _LoginOrRegsiterState extends State<LoginOrRegsiter> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LogIn();
    } else {
      return RegisterPage();
    }
  }
}
