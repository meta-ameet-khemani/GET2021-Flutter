import 'dart:ui';

import 'package:flutter/material.dart';

class MyConstrainedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ConstrainedBox Example'),
          backgroundColor: Colors.greenAccent[400],
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 200, width: 200),
                  child: Text(
                    'A Computer Science portal for geeks. It contains well written,well thought and well explained computer science and programmingarticles, quizzes, interview experiences and much more.',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Container(
                    color: Colors.blueAccent,
                    child: Column(
                      children: [
                        Text('Normal Text Which Contains Something'),
                        RaisedButton(
                          color: Colors.greenAccent[400],
                          onPressed: () {},
                          child: Text(
                            'Click',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
