import 'package:flutter/material.dart';
import 'package:flutterapp_beginning/pages/about_page.dart';
import 'package:flutterapp_beginning/pages/gratitude_page.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  String _howAreYou = "...";

  void _openPageAbout(
      {required BuildContext context, bool fullscreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => AboutPage(),
      ),
    );
  }

  void _openPageGratitude(
      {required BuildContext context, bool fullscreenDialog = false}) async {
    final String _gratitudeResponse = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => const GratitudePage(radioGropuValue: -1),
      ),
    );
    _howAreYou = _gratitudeResponse ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
        actions: [
          IconButton(
            onPressed: () =>
                _openPageAbout(context: context, fullscreenDialog: true),
            icon: Icon(Icons.info_outline),
          )
        ],
      ),
      drawer: NavigationDrawerWidget(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Grateful for: $_howAreYou',
            style: TextStyle(fontSize: 32.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openPageGratitude(context: context);
        },
        tooltip: 'About',
        child: const Icon(Icons.sentiment_satisfied),
      ),
    );
  }
}
