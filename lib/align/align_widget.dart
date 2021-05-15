import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Align Example'),
        ),
        body: Center(
          child: Container(
            color: Colors.blue,
            height: 200,
            width: 200,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Align',
                style: TextStyle(
                  fontSize: 30,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
