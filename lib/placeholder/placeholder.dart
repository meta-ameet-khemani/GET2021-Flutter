import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:selected_widgets/alert_dialog/basic_alert/basic_alert.dart';
// import 'package:selected_widgets/align/align_widget.dart';
// import 'package:selected_widgets/aspect_ratio/aspect_ratio.dart';
// import 'package:selected_widgets/baseline/baseline_widget.dart';
// import 'package:selected_widgets/constrained_box/constrained_box.dart';
// import 'package:selected_widgets/expanded/expanded_widget.dart';
// import 'package:selected_widgets/grid_view/grid_view.dart';
// import 'package:selected_widgets/input_and_selection/input_and_selection.dart';
// import 'package:selected_widgets/intrinsic_height/intrinsic_height.dart';
// import 'package:selected_widgets/intrinsic_width/intrinsic_width.dart';
// import 'package:selected_widgets/page_view/my_page_view.dart';
// import 'package:selected_widgets/progress_indicator/progress_indicator.dart';
// import 'package:selected_widgets/single_child_scroll_view/single_child_scroll_view_1.dart';
// import 'package:selected_widgets/single_child_scroll_view/single_child_scroll_view_2.dart';
// import 'package:selected_widgets/sized_box/sized_box.dart';
// import 'autocmplete/autocomplete_widget.dart';

// void main() => runApp(MyApp());

class MyPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Different Widgets'),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Placeholder(
                    color: Colors.blue,
                    strokeWidth: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Placeholder(
                          fallbackWidth: 100,
                          fallbackHeight: 100,
                          color: Colors.red,
                          strokeWidth: 10,
                        ),
                        Placeholder(
                          fallbackWidth: 100,
                          fallbackHeight: 100,
                          color: Colors.red,
                          strokeWidth: 10,
                        ),
                        Placeholder(
                          fallbackWidth: 100,
                          fallbackHeight: 100,
                          color: Colors.red,
                          strokeWidth: 10,
                        ),
                        Placeholder(
                          fallbackWidth: 100,
                          fallbackHeight: 100,
                          color: Colors.red,
                          strokeWidth: 10,
                        ),
                        Placeholder(
                          fallbackWidth: 100,
                          fallbackHeight: 100,
                          color: Colors.red,
                          strokeWidth: 10,
                        ),
                        Placeholder(
                          fallbackWidth: 100,
                          fallbackHeight: 100,
                          color: Colors.red,
                          strokeWidth: 10,
                        ),
                      ],
                    ),
                  ),
                  Placeholder(),
                  Placeholder(),
                  Placeholder(),
                  Placeholder(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// // stream builder example

// import 'dart:async';
// import 'package:flutter/material.dart';
// // import 'package:flutter_stream_builder_demo/loading_widget.dart';

// void main() => runApp(FlutterStreamBuilder());

// class FlutterStreamBuilder extends StatefulWidget {
//   @override
//   _FlutterStreamBuilderState createState() => _FlutterStreamBuilderState();
// }

// class _FlutterStreamBuilderState extends State<FlutterStreamBuilder> {
//   final imgStream = StreamController<Image>();

//   int imgCounter = -1;

//   final List<Image> imageList = [
//     Image.network(
//       'https://images.unsplash.com/photo-1582719508461-905c673771fd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=625&q=80',
//       fit: BoxFit.cover,
//     ),
//     Image.network(
//       'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
//       fit: BoxFit.cover,
//     ),
//     Image.network(
//       'https://images.unsplash.com/photo-1596178065887-1198b6148b2b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
//       fit: BoxFit.cover,
//     ),
//     Image.network(
//       'https://images.unsplash.com/photo-1610641818989-c2051b5e2cfd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
//       fit: BoxFit.cover,
//     ),
//   ];

//   @override
//   void dispose() {
//     imgStream.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // _height = MediaQuery.of(context).size.height;
//     // _width = MediaQuery.of(context).size.width;
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           height: 200,
//           width: 200,
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   StreamBuilder(
//                       stream: imgStream.stream,
//                       builder: (BuildContext context,
//                           AsyncSnapshot<dynamic> snapshot) {
//                         if (!snapshot.hasData) {
//                           return Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               CircularProgressIndicator(
//                                   //   backgroundColor:Colors.red,
//                                   ),
//                               SizedBox(
//                                 height: 100,
//                               ),
//                               Text(
//                                 'Clicks Button',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ],
//                           );
//                           // Loader();
//                         }

//                         if (snapshot.connectionState == ConnectionState.done) {}

//                         return Container(
//                           height: 220,
//                           width: 220,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                           ),
//                           //  color: snapshot.data,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                             child: snapshot.data,
//                           ),
//                         );
//                       }),
//                   RaisedButton(
//                     shape: new RoundedRectangleBorder(
//                       borderRadius: new BorderRadius.circular(30.0),
//                     ),
//                     onPressed: () {
//                       // colorStream.sink.add(Colors.blue);

//                       imgCounter++;

//                       if (imgCounter < imageList.length) {
//                         imgStream.sink.add(imageList[imgCounter]);
//                       } else {
//                         imgStream.close();
//                       }
//                     },
//                     color: Colors.red,
//                     textColor: Colors.white,
//                     child: Text("  Click Me  ".toUpperCase(),
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 1)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // future builder example

// // import 'package:flutter/material.dart';

// // void main() => runApp(MyApp());

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Widget Example',

// //       // to hide debug banner
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         primarySwatch: Colors.green,
// //       ),
// //       home: HomePage(),
// //     );
// //   }
// // }

// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Example'),
// //         ),
// //         body: Center(
// //           child: ElevatedButton(
// //             onPressed: () => Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                 builder: (ctx) => FutureDemoPage(),
// //               ),
// //             ),
// //             child: Text('Demonstrate FutureBuilder'),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class FutureDemoPage extends StatelessWidget {
// //   /// Function that will return a
// //   /// "string" after some time
// //   /// To demonstrate network call
// //   /// delay of [2 seconds] is used
// //   ///
// //   /// This function will behave as an
// //   /// asynchronous function
// //   Future<String> getData() {
// //     return Future.delayed(Duration(seconds: 2), () {
// //       return "I am data";
// //       // throw Exception("Custom Error");
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Future Demo Page'),
// //         ),
// //         body: FutureBuilder(
// //           builder: (ctx, snapshot) {
// //             // Checking if future is resolved or not
// //             if (snapshot.connectionState == ConnectionState.done) {
// //               // If we got an error
// //               if (snapshot.hasError) {
// //                 return Center(
// //                   child: Text(
// //                     '${snapshot.error} occured',
// //                     style: TextStyle(fontSize: 18),
// //                   ),
// //                 );

// //                 // if we got our data
// //               } else if (snapshot.hasData) {
// //                 // Extracting data from snapshot object
// //                 final data = snapshot.data as String;
// //                 return Center(
// //                   child: Text(
// //                     '$data',
// //                     style: TextStyle(fontSize: 18),
// //                   ),
// //                 );
// //               }
// //             }

// //             // Displaying LoadingSpinner to indicate waiting state
// //             return Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           },

// //           // Future that needs to be resolved
// //           // inorder to display something on the Canvas
// //           future: getData(),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // normal example

// // import 'package:flutter/material.dart';
// // import 'dart:async' show Future, Timer;
// // import 'package:flutter/services.dart' show rootBundle;

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //         visualDensity: VisualDensity.adaptivePlatformDensity,
// //       ),
// //       home: MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   MyHomePage({Key key, this.title}) : super(key: key);

// //   final String title;

// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;

// //   void _incrementCounter() {
// //     setState(() {
// //       _counter++;
// //     });
// //   }

// //   Future<String> loadAsset() async {
// //     return await rootBundle.loadString('assets/users.json');
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     print('asdf');
// //     // String data = loadAsset().then((value) => print(value)) as String;
// //     // print(data);
// //     // json.decode();
// //     Future.delayed(Duration(seconds: 3), () {
// //       print('after 3 second');
// //     });
// //     Timer.periodic(Duration(seconds: 3), (timer) {
// //       print('after 3 second');
// //     });
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             Text(
// //               'You have pushed the button this many times:',
// //             ),
// //             Text(
// //               '$_counter',
// //               style: Theme.of(context).textTheme.headline4,
// //             ),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }
