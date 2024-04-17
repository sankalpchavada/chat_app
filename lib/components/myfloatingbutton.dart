import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../services/auth/auth_services.dart';
import '../utils/colors.dart';

class myFloatingButton extends StatefulWidget {
  const myFloatingButton({super.key});

  @override
  State<myFloatingButton> createState() => _myFloatingButtonState();
}

class _myFloatingButtonState extends State<myFloatingButton> {
  void signOut() async {
    final auth = AuthService();

    try {
      await auth.logout();
      print("-------------Logged out------------");
    } catch (e) {
      print(e.toString());
    }
  }

  //
  // // FloatController controller = Get.find();
  // FloatController floatController = Get.put(FloatController());

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: Icon(Icons.settings),
        //foregroundColor: myColor,

        backgroundColor: myColor,
      ),
      type: ExpandableFabType.fan,
      pos: ExpandableFabPos.right,
      distance: 80,
      children: [
        FloatingActionButton.small(
            backgroundColor: myColor,
            onPressed: () {},
            child: Icon(Icons.logout_rounded)),
        FloatingActionButton.small(
            backgroundColor: myColor,
            onPressed: () {},
            child: Icon(Icons.nightlight_outlined)),
        FloatingActionButton.small(
            backgroundColor: myColor,
            onPressed: () {},
            child: Icon(Icons.person_3_outlined)),
      ],
    );
  }
}
