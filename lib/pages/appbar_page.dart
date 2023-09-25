import 'package:flutter/material.dart';
import 'package:flutterapp_beginning/pages/birthdays_page.dart';
import 'package:flutterapp_beginning/pages/gratitude2_page.dart';
import 'package:flutterapp_beginning/pages/gratitude_page.dart';
import 'package:flutterapp_beginning/pages/reminders_page.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({super.key});

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_tabChanged);
  }

  @override
  void dispose() {
    super.dispose();

    @override
    void dispose() {
      _tabController.dispose();
      super.dispose();
    }

    _tabController.dispose();
  }

  void _tabChanged() {
    if (_tabController.indexIsChanging) {
      print('tabChanged: ${_tabController.index}');
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AppBar')),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            BirthdaysPage(),
            Gratitude2Page(),
            RemindersPage(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black54,
          unselectedLabelColor: Colors.black38,
          tabs: [
            Tab(
              icon: Icon(Icons.cake),
              text: "Birthdays",
            ),
            Tab(
              icon: Icon(Icons.sentiment_satisfied),
              text: "Gratitude",
            ),
            Tab(
              icon: Icon(Icons.access_alarm),
              text: "Reminders",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
