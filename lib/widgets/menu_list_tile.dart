import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp_beginning/pages/birthdays_page.dart';
import 'package:flutterapp_beginning/pages/gratitude2_page.dart';
import 'package:flutterapp_beginning/pages/gratitude_page.dart';
import 'package:flutterapp_beginning/pages/reminders_page.dart';

class MenuListTileWidget extends StatefulWidget {
  const MenuListTileWidget({super.key});

  @override
  State<MenuListTileWidget> createState() => _MenuListTileWidgetState();
}

class _MenuListTileWidgetState extends State<MenuListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.cake),
          title: Text('Birthdays'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BirthdaysPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.sentiment_satisfied),
          title: Text('Gratitude'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Gratitude2Page(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.alarm),
          title: Text('Reminders'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RemindersPage(),
              ),
            );
          },
        ),
        Divider(
          color: Colors.grey,
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Setting'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
