import 'package:flutter/material.dart';
import 'package:flutterapp_beginning/pages/birthdays_page.dart';
import 'package:flutterapp_beginning/pages/gratitude2_page.dart';
import 'package:flutterapp_beginning/pages/gratitude_page.dart';
import 'package:flutterapp_beginning/pages/reminders_page.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _currentIndex = 0;
  List _listPages = [];
  Widget _currentPage = Container();
  @override
  void initState() {
    super.initState();
    _listPages
      ..add(BirthdaysPage())
      ..add(Gratitude2Page())
      ..add(RemindersPage());
    _currentPage = BirthdaysPage();
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomNavigationBar')),
      drawer: NavigationDrawerWidget(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: _currentPage,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Birthdays',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied),
            label: 'Gratitude',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: 'Reminders',
          ),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }
}
