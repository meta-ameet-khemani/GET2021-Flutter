import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {

  final Color color;
  final String title;

  CategoryMeals(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${title} Meals', style: TextStyle(backgroundColor: color),),
          // backgroundColor: color,
          backgroundColor: Colors.tealAccent,
        ),
        body: Center(
          child: Text('asdf'),
        ),
    );
  }
}
