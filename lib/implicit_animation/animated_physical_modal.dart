import 'package:flutter/material.dart';

class AnimatedPhysicalModalWidget extends StatefulWidget {
  @override
  _AnimatedPhysicalModalWidgetState createState() =>
      _AnimatedPhysicalModalWidgetState();
}

class _AnimatedPhysicalModalWidgetState
    extends State<AnimatedPhysicalModalWidget> {
  bool _first = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedPhysicalModel(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          elevation: _first ? 0 : 10.0,
          shape: BoxShape.rectangle,
          shadowColor: Colors.black,
          color: Colors.white,
          borderRadius: _first
              ? const BorderRadius.all(Radius.circular(0))
              : const BorderRadius.all(Radius.circular(20)),
          child: Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue[70],
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          child: const Text('Click Me!'),
          onPressed: () {
            setState(() {
              _first = !_first;
            });
          },
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// class AnimatedPhysicalModalWidget extends StatefulWidget {
//   @override
//   _AnimatedPhysicalModalWidgetState createState() =>
//       _AnimatedPhysicalModalWidgetState();
// }

// class _AnimatedPhysicalModalWidgetState
//     extends State<AnimatedPhysicalModalWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         child: AnimatedPhysicalModel(
//           elevation: 20,
//           shadowColor: Colors.black,
//           color: Colors.black,
//           duration: Duration(seconds: 2),
//           shape: BoxShape.rectangle,
//           child: Container(
//             height: 200,
//             width: 200,
//             color: Colors.blue,
//           ),
//         ),
//       ),
//     );
//   }
// }
