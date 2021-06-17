import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalMarks;
  final Function reset;

  Result(this.totalMarks, this.reset);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Result $totalMarks',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: RaisedButton.icon(
            onPressed: reset as void Function()?,
            color: Colors.blueAccent,
            textColor: Colors.white,
            icon: Icon(Icons.reset_tv),
            label: Text('Try Again')),
      ),
    );
  }
}
