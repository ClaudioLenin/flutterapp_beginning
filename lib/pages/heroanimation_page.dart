import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp_beginning/pages/fly_page.dart';

class HeroAnimationPage extends StatefulWidget {
  const HeroAnimationPage({super.key});

  @override
  State<HeroAnimationPage> createState() => _HeroAnimationPageState();
}

class _HeroAnimationPageState extends State<HeroAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          child: Hero(
            tag: "format_paint",
            child: Icon(
              Icons.format_paint,
              color: Colors.lightGreen,
              size: 120.0,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FlyPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
