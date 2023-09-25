import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Gratitude2Page extends StatelessWidget {
  const Gratitude2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.sentiment_satisfied,
          size: 120.0,
          color: Colors.lightGreen,
        ),
      ),
    );
  }
}
