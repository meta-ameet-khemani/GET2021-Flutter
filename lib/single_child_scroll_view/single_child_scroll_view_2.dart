import 'package:flutter/material.dart';

class MySingleChildScrollView2 extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic Alert Box'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
                child: new Image.network(
                  'https://images.unsplash.com/photo-1439535184894-489a1f018921?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
                  height: 200.0,
                  width: 500,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: new Text(
                    "Some Heading Text",
                    style: new TextStyle(
                      fontSize: 28.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              new Expanded(
                flex: 1,
                child: Scrollbar(
                  // showTrackOnHover: true,
                  controller: scrollController,
                  isAlwaysShown: true,
                  thickness: 15,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          Icons.car_rental,
                          size: 40,
                        ),
                        title: Text('Hello ! This is car no: ${index + 1}'),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
