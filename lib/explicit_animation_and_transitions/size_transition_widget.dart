import 'package:flutter/material.dart';

class SizeTransitionWidget extends StatefulWidget {
  @override
  _SizeTransitionWidgetState createState() => _SizeTransitionWidgetState();
}

class _SizeTransitionWidgetState extends State<SizeTransitionWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizeTransition(
          child: Image.asset('assets/images/angry_bird.jpg'),
          sizeFactor: CurvedAnimation(
            curve: Curves.linear,
            parent: controller,
          ),
        ),
      ),
    );
  }
}
