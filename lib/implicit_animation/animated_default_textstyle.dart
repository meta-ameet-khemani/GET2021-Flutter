import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleWidgetState createState() =>
      _AnimatedDefaultTextStyleWidgetState();
}

class _AnimatedDefaultTextStyleWidgetState
    extends State<AnimatedDefaultTextStyleWidget> {
  bool _first = true;

  double _fontSize = 60;
  Color _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _fontSize = _first ? 90 : 60;
        _color = _first ? Colors.blue : Colors.red;
        _first = !_first;
      });
      Future.delayed(Duration(seconds: 10)).then((value) {
        timer.cancel();
      });
    });
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 120,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontSize: _fontSize,
                color: _color,
                fontWeight: FontWeight.bold,
              ),
              child: Text('Flutter'),
            ),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                _fontSize = _first ? 90 : 60;
                _color = _first ? Colors.blue : Colors.red;
                _first = !_first;
              });
            },
            child: Text(
              "CLICK ME!",
            ),
          )
        ],
      ),
    );
  }
}
