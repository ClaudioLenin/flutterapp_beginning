import 'package:flutter/material.dart';
import 'package:flutterapp_beginning/widgets/animated_balloon.dart';
import 'package:flutterapp_beginning/widgets/animated_container.dart';
import 'package:flutterapp_beginning/widgets/animated_cross_fade.dart';
import 'package:flutterapp_beginning/widgets/animated_opacity.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation')),
      drawer: NavigationDrawerWidget(),
      body: SafeArea(
        child: Column(children: [
          AnimatedContainerWidget(),
          Divider(),
          AnimatedCrossFadeWidget(),
          Divider(),
          AnimatedOpacityWidget(),
          Divider(),
        ]),
      ),
    );
  }
}
