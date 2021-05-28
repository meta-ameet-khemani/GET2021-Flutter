import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerWidget extends StatefulWidget {
  @override
  AnimatedContainerWidgetState createState() => AnimatedContainerWidgetState();
}

class AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double _width = 70;
  double _height = 70;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.green,
        onPressed: () {
          setState(() {
            final random = Random();

            _width = random.nextInt(500).toDouble();
            _height = random.nextInt(500).toDouble();

            _color = Color.fromRGBO(
              random.nextInt(300),
              random.nextInt(300),
              random.nextInt(300),
              1,
            );

            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
      ),
    );
  }
}
