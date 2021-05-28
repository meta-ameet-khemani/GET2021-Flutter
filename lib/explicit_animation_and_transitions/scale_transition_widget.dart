import 'package:flutter/material.dart';

class ScaleTransitionWidget extends StatefulWidget {
  @override
  _ScaleTransitionWidgetState createState() => _ScaleTransitionWidgetState();
}

class _ScaleTransitionWidgetState extends State<ScaleTransitionWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
      value: 0.1,
    );

    _animation = CurvedAnimation(
      curve: Curves.bounceInOut,
      parent: _animationController,
    );

    _animationController.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Container(
            width: 100,
            height: 100,
            child: Icon(
              Icons.check,
              color: Colors.yellow,
              size: 200,
            ),
          ),
        ),
      ),
    );
  }
}
