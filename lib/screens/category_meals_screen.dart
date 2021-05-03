import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {

  static  String routeName = '/category-meal';

  // final Color color;
  // final String title;
  //
  // CategoryMeals(this.title, this.color);

  @override
  Widget build(BuildContext context) {

    final routeArguments = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final title = routeArguments['title'];
    final Color color = routeArguments['color'] as Color;

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
