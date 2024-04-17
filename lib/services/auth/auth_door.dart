import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_miner/pages/home.dart';
import 'package:firebase_miner/services/auth/login_or_register.dart';
import 'package:flutter/material.dart';


class AuthDoor extends StatelessWidget {
  const AuthDoor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return LoginOrRegsiter();
            }
          }
        },
      ),
    );
  }
}
