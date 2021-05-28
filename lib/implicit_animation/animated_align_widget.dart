import 'dart:async';
import 'package:flutter/material.dart';

// class AnimatedAlignWidget extends StatefulWidget {
//   @override
//   _AnimatedAlignWidgetState createState() => _AnimatedAlignWidgetState();
// }

// class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
//   Alignment _alginment = Alignment.topRight;

//   @override
//   Widget build(BuildContext context) {
//     Timer(Duration(seconds: 2), () {
//       _alginment = Alignment.bottomLeft;
//     });
//     return Container(
//       child: AnimatedAlign(
//         alignment: _alginment,
//         curve: Curves.bounceIn,
//         duration: Duration(seconds: 3),
//         child: Image.network(
//           'https://images.unsplash.com/photo-1612412664025-052be804ccf7?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDd8SnBnNktpZGwtSGt8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
//           height: 100,
//           width: 100,
//         ),
//       ),
//     );
//   }
// }

class AnimatedAlignWidget extends StatefulWidget {
  @override
  _AnimatedAlignWidgetState createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  AlignmentGeometry _alignment = Alignment.topRight;
  AlignmentGeometry _geometry = Alignment.bottomLeft;
  Curve _curve = Curves.easeInOutBack;

  void _changeAlignment(Curve curve) {
    setState(() {
      _curve = curve;
      _alignment = _alignment == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
      _geometry = _alignment == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('assets/images/angry_bird.jpg'),
            //   fit: BoxFit.cover,
            // ),
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: _alignment,
                curve: _curve,
                duration: Duration(seconds: 3),
                child: Image.asset(
                  'assets/images/snake.jpg',
                  height: 75,
                  width: 75,
                ),
              ),
              AnimatedAlign(
                alignment: _geometry,
                curve: _curve,
                duration: Duration(seconds: 3),
                child: Image.asset(
                  'assets/images/angry_bird.jpg',
                  height: 75,
                  width: 75,
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () => _changeAlignment(Curves.easeInOutBack),
                  child: Text('easeInOutBack'),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () => _changeAlignment(Curves.elasticInOut),
                child: Text('elasticInOut'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () => _changeAlignment(Curves.bounceInOut),
                child: Text('bounceInOut'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () =>
                    _changeAlignment(Curves.fastLinearToSlowEaseIn),
                child: Text('fastLinearToSlowEaseIn'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () => _changeAlignment(Curves.easeInCubic),
                child: Text('easeInCubic'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () => _changeAlignment(Curves.easeInOutQuint),
                child: Text('easeInOutQuint'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () => _changeAlignment(Curves.slowMiddle),
                child: Text('slowMiddle'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
