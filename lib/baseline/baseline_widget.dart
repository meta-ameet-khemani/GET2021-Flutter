import 'package:flutter/material.dart';

class MyBaselineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                color: Colors.blue,
                alignment: Alignment.topCenter,
                child: Baseline(
                  baseline: 10,
                  baselineType: TextBaseline.alphabetic,
                  child: Container(
                    width: 35,
                    height: 35,
                    child: Icon(Icons.star),
                    // color: Colors.yellow,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '(a + b)',
                    style: TextStyle(fontSize: 30),
                  ),
                  Baseline(
                    baseline: -15,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Text(
                    '= a',
                    style: TextStyle(fontSize: 30),
                  ),
                  Baseline(
                    baseline: -15,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Text(
                    '+ b',
                    style: TextStyle(fontSize: 30),
                  ),
                  Baseline(
                    baseline: -15,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Text(
                    '+ 2ab',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
