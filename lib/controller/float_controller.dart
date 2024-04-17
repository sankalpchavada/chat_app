import 'package:firebase_miner/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatController extends GetxController {
  final AuthService authService = AuthService();
  RxBool isDarkMode = false.obs;

  void signOut() async {
    try {
      await authService.logout();
      update();
      print("-------------Logged out------------");
    } catch (e) {
      print(e.toString());
    }
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    if (isDarkMode.value) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
  }
}
