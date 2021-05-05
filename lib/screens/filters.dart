import 'package:flutter/material.dart';
import 'main_drawer.dart';

class Filters extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Center(
          child: Text('Filters'),
        ),
      ),
    );
  }
}
