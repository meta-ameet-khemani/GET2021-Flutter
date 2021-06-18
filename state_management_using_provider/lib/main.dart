import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_using_provider/user_provider.dart';

import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => UserProvider(),
        child: Consumer<UserProvider>(
          builder: (context, value, child) {
            if (value.getUser == null) {
              return HomePage();
            } else {
              return Another();
            }
          },
        ),
      ),
    );
  }
}

class Another extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another'),
      ),
      body: Center(
        child: Text('asdfasdf asdf sadf sdf'),
      ),
    );
  }
}
