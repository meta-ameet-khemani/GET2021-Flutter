import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Row Widget example'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "1. Text",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  "2. Text",
                  style: TextStyle(fontSize: 60.0),
                ),
                Text(
                  "3. Text",
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
                Widget>[
              Container(
                margin: EdgeInsets.all(12.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green),
                child: Text(
                  "React.js",
                  style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green),
                child: Text(
                  "Flutter",
                  style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green),
                child: Text(
                  "MySQL",
                  style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
                ),
              )
            ]),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'one one one',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Expanded(
                  child: Text(
                    'two two two',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Expanded(
                  child: Text(
                    'three three three',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const FlutterLogo(),
                Expanded(
                  child: const FlutterLogo(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
