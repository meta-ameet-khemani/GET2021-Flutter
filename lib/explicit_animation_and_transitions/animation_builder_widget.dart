import 'dart:math';
import 'package:flutter/material.dart';

class AnimationBuilderWidget extends StatefulWidget {
  @override
  _AnimationBuilderWidgetState createState() => _AnimationBuilderWidgetState();
}

class _AnimationBuilderWidgetState extends State<AnimationBuilderWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController1;
  late AnimationController _animationController2;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _animationController1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animationController1.forward();

    _animationController2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animationController2.repeat();

    _animation1 =
        Tween<double>(begin: 0, end: 2 * pi).animate(_animationController1);

    _animation2 =
        Tween<double>(begin: 0, end: 2 * pi).animate(_animationController2);
  }

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: AnimatedBuilder(
            child: Center(
              child: Container(
                color: Colors.blue,
                height: 200,
                width: 200,
              ),
            ),
            animation: _animation1,
            builder: (context, child) => Transform.rotate(
              angle: _animation1.value,
              child: child,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          child: AnimatedBuilder(
            child: Center(
              child: Container(
                color: Colors.blue,
                height: 200,
                width: 200,
              ),
            ),
            animation: _animation2,
            builder: (context, child) => Transform.rotate(
              angle: _animation2.value,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
