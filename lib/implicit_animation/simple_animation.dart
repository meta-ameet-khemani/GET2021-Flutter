import 'package:flutter/material.dart';

class SimpleAnimation extends StatefulWidget {
  @override
  _SimpleAnimationState createState() => _SimpleAnimationState();
}

class _SimpleAnimationState extends State<SimpleAnimation> {
  double _margin = 0;
  double _opacity = 1;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(
          seconds: 2,
        ),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  _margin = 50;
                });
              },
              child: Text('Animate Margin'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _width = 300;
                });
              },
              child: Text('Animate Width'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _color = Colors.green;
                });
              },
              child: Text('Animate Color'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _opacity = 0;
                });
              },
              child: Text('Animate Opacity'),
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 2),
              child: Text(
                'Some Testing Text',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
