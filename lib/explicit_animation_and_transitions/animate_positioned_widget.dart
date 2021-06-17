import 'package:flutter/material.dart';

class PositionedTransitionWidget extends StatefulWidget {
  @override
  _PositionedTransitionWidgetState createState() =>
      _PositionedTransitionWidgetState();
}

class _PositionedTransitionWidgetState extends State<PositionedTransitionWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animationController.forward();

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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.yellow,
              child: Stack(
                children: [
                  PositionedTransition(
                    rect: RelativeRectTween(
                      begin: RelativeRect.fromLTRB(60, 60, 0, 0),
                      end: RelativeRect.fromLTRB(0, 0, 20, 20),
                    ).animate(_animationController),
                    child: Container(
                      height: 10,
                      width: 10,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
