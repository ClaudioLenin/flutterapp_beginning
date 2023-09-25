import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AnimatedBalloonWidget extends StatefulWidget {
  const AnimatedBalloonWidget({super.key});

  @override
  State<AnimatedBalloonWidget> createState() => _AnimatedBalloonWidgetState();
}

class _AnimatedBalloonWidgetState extends State<AnimatedBalloonWidget>
    with TickerProviderStateMixin {
  late AnimationController _controllerFloatUp;
  late AnimationController _controllerGrowSize;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    _controllerFloatUp =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _controllerGrowSize =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controllerFloatUp.dispose();
    _controllerGrowSize.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double _balloonHeight = MediaQuery.of(context).size.height / 2;
    double _balloonWidth = MediaQuery.of(context).size.height / 3;
    double _balloonBottomLocation =
        MediaQuery.of(context).size.height - _balloonHeight;
    return const Placeholder();
  }
}
