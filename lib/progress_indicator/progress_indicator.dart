import 'dart:async';

import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial by Woolha.com',
      home: _CircularProgressIndicatorApp(),
    );
  }
}

class _CircularProgressIndicatorApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CircularProgressIndicatorAppState();
  }
}

class _CircularProgressIndicatorAppState
    extends State<_CircularProgressIndicatorApp> {
  double _progress = 0;

  void startTimer() {
    new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          print(_progress);
          if (_progress == 1) {
            timer.cancel();
          } else {
            _progress += 0.2;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    return Scaffold(
      appBar: AppBar(
        title: Text('Woolha.com Flutter Tutorial'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircularProgressIndicator(
                strokeWidth: 10,
                backgroundColor: Colors.cyanAccent,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                value: _progress,
              ),
              RaisedButton(
                child: Text('Start timer'),
                onPressed: () {
                  setState(() {
                    _progress = 0;
                  });
                  startTimer();
                },
              ),
              LinearProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyProgressIndicator extends StatefulWidget {
//   @override
//   _MyProgressIndicatorState createState() => _MyProgressIndicatorState();
// }

// class _MyProgressIndicatorState extends State<MyProgressIndicator> {
//   double initialValue = 0.1;

//   void spinnerLife() {
//     Timer.periodic(Duration(seconds: 2), (timer) {
//       print('$initialValue');
//       print('${timer.isActive}');
//       setState(() {
//         initialValue += 0.1;
//         if (initialValue >= 1) {
//           timer.cancel();
//           if (timer.isActive) {
//             timer.cancel();
//           }
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('asdf');
//     // spinnerLife();
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Different Widgets'),
//         ),
//         body: Center(
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 CircularProgressIndicator(
//                   backgroundColor: Colors.red,
//                   strokeWidth: 6,
//                   valueColor: AlwaysStoppedAnimation(Colors.yellow),
//                   value: initialValue,
//                 ),
//                 LinearProgressIndicator(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
