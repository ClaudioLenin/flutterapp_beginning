import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class FlyPage extends StatelessWidget {
  const FlyPage({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.shortestSide / 2;
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation')),
      drawer: NavigationDrawerWidget(),
      body: SafeArea(
        child: Hero(
          tag: 'format_paint',
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Icon(
              Icons.format_paint,
              color: Colors.lightGreen,
              size: _width,
            ),
          ),
        ),
      ),
    );
  }
}
