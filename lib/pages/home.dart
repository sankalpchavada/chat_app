import 'package:firebase_miner/services/auth/auth_services.dart';
import 'package:firebase_miner/services/chat/chat_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/animated_typer.dart';
import '../components/myfloatingbutton.dart';
import '../components/usertile.dart';
import '../utils/colors.dart';
import 'chatpage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  TextStyle urbanist =
      GoogleFonts.urbanist(color: Colors.white, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        title: AnimatedText(
          text: "Hello chat!",
        ),
      ),
      body: buildUserList(),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: myFloatingButton(),
    );
  }

  Widget buildUserList() {
    return StreamBuilder(
      stream: chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SpinKitHourGlass(
              color: myColor,
              size: 70,
            ),
          );
        }

        if (snapshot.hasError) {
          return Text("Error");
        }

        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget buildUserListItem(
      Map<String, dynamic> userdata, BuildContext context) {
    if (userdata['email'] != authService.getCurrentUser()!.email) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: userTile(
            text: userdata['email'],
            id: userdata['uid'],
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      recieverEmail: userdata['email'],
                      recieverID: userdata['uid'],
                    ),
                  ));
            }),
      );
    } else {
      return Container();
    }
  }
}
