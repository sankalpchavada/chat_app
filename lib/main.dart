import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_miner/services/auth/auth_door.dart';
import 'package:firebase_miner/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightMode,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: AuthDoor(),
    );
  }
}
