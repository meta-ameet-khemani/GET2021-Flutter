import 'package:flutter/material.dart';

class MyIntrinsicWidth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inrinsic Width'),
          centerTitle: true,
        ),
        body: Center(
          child: IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Text(
                    'Hello',
                    style: TextStyle(fontSize: 30),
                  ),
                  color: Colors.blueAccent,
                ),
                Container(
                  child: Text(
                    'World !!!!',
                    style: TextStyle(fontSize: 30),
                  ),
                  color: Colors.yellowAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
