import 'package:firebase_miner/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../services/auth/auth_services.dart';

// class HomeDrawer extends StatelessWidget {
//   HomeDrawer({super.key});
//
//   bool checkLogOut = false;
//   void signOut() {
//     final auth = AuthService();
//
//     try {
//       auth.logout().then((value) {
//         print("-------------Logged out------------");
//       });
//       setState() {
//         checkLogOut = true;
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       shape: LinearBorder.start(),
//       width: 250,
//       backgroundColor: Theme.of(context).colorScheme.background,
//       child: Column(
//         children: [
//           DrawerHeader(
//               decoration:
//                   BoxDecoration(border: Border.all(color: Colors.transparent)),
//               child: Center(
//                 child: Icon(
//                   Icons.message_outlined,
//                   color: Colors.blue,
//                   size: 70,
//                 ),
//               )),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//               leading: Icon(Icons.home_filled),
//               title: Text("H O M E"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("S E T T I N G S"),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SettingsPage(),
//                     ));
//               },
//             ),
//           ),
//           SizedBox(
//             height: 300,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//               leading: Icon(Icons.login),
//               title: Text("L O G O U T"),
//               onTap: () {
//                 signOut();
//                 if (checkLogOut == true) {
//                   Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => LogIn(),
//                       ));
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class HomeDrawer extends StatefulWidget {
  HomeDrawer({super.key});

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  bool checkLogOut = false;

  void signOut() async {
    final auth = AuthService();

    try {
      await auth.logout();
      print("-------------Logged out------------");
      setState(() {
        checkLogOut = true;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      shape: LinearBorder.start(),
      width: 250,
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.transparent)),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 70,
                      width: 70,
                      child: Center(
                          child: Lottie.asset(
                        "assets/icon/chat_icon2.json",
                        fit: BoxFit.cover,
                      ))),
                  const SizedBox(height: 10),
                  Text('Hey Chat!', style: GoogleFonts.lexend(fontSize: 20)),
                ],
              ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.home_filled),
              title: Text("H O M E"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("S E T T I N G S"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ));
              },
            ),
          ),
          SizedBox(
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.login),
              title: Text("L O G O U T"),
              onTap: () {
                signOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
