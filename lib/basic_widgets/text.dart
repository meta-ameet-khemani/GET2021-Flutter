import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Text Widget example\n\n\n'),
          DefaultTextStyle(
            style: TextStyle(fontSize: 36, color: Colors.blue),
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'The first text : default',
                  ),
                  const Text(
                    'The second text : half default',
                    style: TextStyle(fontSize: 24),
                  ),
                  const Text(
                    'The third text : half',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'The fourth text : outer text',
          ),
          RichText(
            text: TextSpan(
                text: '\n\n\nDon\'t have an account?',
                style: TextStyle(color: Colors.black, fontSize: 20),
                children: [
                  TextSpan(
                      text: ' Sign up',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(
                    text: '\n\nClick ',
                    style: TextStyle(fontSize: 25),
                  ),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Icon(Icons.add, color: Colors.red),
                    ),
                  ),
                  TextSpan(
                    text: 'for adding ',
                    style: TextStyle(fontSize: 25),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
