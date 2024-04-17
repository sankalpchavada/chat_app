import 'package:flutter/material.dart';

class PopupMenu extends StatefulWidget {
  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  ThemeMode _themeMode = ThemeMode.light;

  void _changeTheme() {
    setState(() {
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.light;
      }
    });
  }

  void _logOut() {
    // Add your logout logic here
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        // popupmenu item 1
        PopupMenuItem(
          value: 1,
          // row has two child icon and text.
          child: Row(
            children: [
              Icon(Icons.color_lens),
              SizedBox(
                // sized box with width 10
                width: 10,
              ),
              Text("Change Theme"),
            ],
          ),
        ),
        // popupmenu item 2
        PopupMenuItem(
          value: 2,
          // row has two child icon and text
          child: Row(
            children: [
              Icon(Icons.logout),
              SizedBox(
                // sized box with width 10
                width: 10,
              ),
              Text("Log Out"),
            ],
          ),
        ),
      ],
      offset: Offset(0, 100),
      color: Colors.grey,
      elevation: 2,
      onSelected: (value) {
        switch (value) {
          case 1:
            _changeTheme();
            break;
          case 2:
            _logOut();
            break;
          default:
            break;
        }
      },
    );
  }
}
