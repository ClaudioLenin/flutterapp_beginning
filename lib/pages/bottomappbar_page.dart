import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class BottomAppBarPage extends StatefulWidget {
  const BottomAppBarPage({super.key});

  @override
  State<BottomAppBarPage> createState() => _BottomAppBarPageState();
}

class _BottomAppBarPageState extends State<BottomAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomAppBar')),
      body: SafeArea(child: Container()),
      drawer: NavigationDrawerWidget(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade200,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.access_alarm),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark_border),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.flight),
              color: Colors.white,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
