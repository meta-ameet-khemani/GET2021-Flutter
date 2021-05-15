import 'package:flutter/material.dart';

class MyIntrinsicHeightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Intrinsic Height'),
          centerTitle: true,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: IntrinsicHeight(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(children: [
                        Container(
                          height: 120.0,
                          color: Colors.yellow,
                        ),
                        Container(
                          height: 100.0,
                          color: Colors.cyan,
                        ),
                      ]),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.amber,
                      ),
                    ),
                  ]),
            ),
          ),
          // child: IntrinsicHeight(
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     children: [
          //       Expanded(
          //         child: RaisedButton(
          //           onPressed: () {},
          //           child: Text('First button'),
          //         ),
          //       ),
          //       Expanded(
          //         child: RaisedButton(
          //           onPressed: () {},
          //           child: Text('Second long button'),
          //         ),
          //       ),
          //       Flexible(
          //         child: RaisedButton(
          //           onPressed: () {},
          //           child: Text('Third is the largest of all buttons'),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // child: Column(
          //   children: [
          //     Row(
          //       crossAxisAlignment: CrossAxisAlignment.stretch,
          //       children: [
          //         Expanded(
          //           child: RaisedButton(
          //             onPressed: () {},
          //             child: Text('First button'),
          //           ),
          //         ),
          //         Expanded(
          //           child: RaisedButton(
          //             onPressed: () {},
          //             child: Text('Second long button'),
          //           ),
          //         ),
          //         Flexible(
          //           child: RaisedButton(
          //             onPressed: () {},
          //             child: Text('Third is the largest of all buttons'),
          //           ),
          //         ),
          //       ],
          //     ),
          //     // SizedBox(
          //     //   height: 25,
          //     // ),
          //     // Row(
          //     //   children: [
          //     //     RaisedButton(
          //     //       onPressed: () {},
          //     //       child: Text('First button'),
          //     //     ),
          //     //     RaisedButton(
          //     //       onPressed: () {},
          //     //       child: Text('Second long button'),
          //     //     ),
          //     //     Flexible(
          //     //       child: RaisedButton(
          //     //         onPressed: () {},
          //     //         child: Text('Third is the largest of all buttons'),
          //     //       ),
          //     //     ),
          //     //   ],
          //     // ),
          //     // SizedBox(
          //     //   height: 25,
          //     // ),
          //     // IntrinsicHeight(
          //     //   child: Row(
          //     //     children: [
          //     //       RaisedButton(
          //     //         onPressed: () {},
          //     //         child: Text('First button'),
          //     //       ),
          //     //       RaisedButton(
          //     //         onPressed: () {},
          //     //         child: Text('Second long button'),
          //     //       ),
          //     //       Flexible(
          //     //         child: RaisedButton(
          //     //           onPressed: () {},
          //     //           child: Text('Third is the largest of all buttons'),
          //     //         ),
          //     //       ),
          //     //     ],
          //     //   ),
          //     // ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
