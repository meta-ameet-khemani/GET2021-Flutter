import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Container Widget example\n'),
            Container(
              child: Text(
                "Hello! I am in the container widget decoration box!!",
                style: TextStyle(fontSize: 30),
              ),
              // color: Colors.blueAccent,
              // margin: EdgeInsets.fromLTRB(100, 100, 0, 0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.green,
                    offset: new Offset(6.0, 6.0),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 150.0,
              color: Colors.green,
              margin: EdgeInsets.all(25),
              padding: EdgeInsets.all(35),
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(0.1),
              child: Text("Hello! I am in the container widget!!",
                  style: TextStyle(fontSize: 25)),
            ),
          ],
        ),
      ),
    );
  }
}
