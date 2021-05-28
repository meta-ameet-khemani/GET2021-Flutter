import 'package:flutter/material.dart';

class MyTweenAnimationBuilder extends StatefulWidget {
  @override
  _MyTweenAnimationBuilderState createState() =>
      _MyTweenAnimationBuilderState();
}

class _MyTweenAnimationBuilderState extends State<MyTweenAnimationBuilder> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(
        seconds: 5,
      ),
      child: Container(
        width: double.infinity,
        child: Text(
          'Some text/ App name',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        color: Colors.yellowAccent,
      ),
      builder: (context, value, Widget child) {
        return Opacity(
          opacity: value,
          child: Padding(
            padding: EdgeInsets.only(
              top: value * 200,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
