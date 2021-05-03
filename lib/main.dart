import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import './screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        CategoryMeals.routeName: (context) => CategoryMeals(),
      },
      home: CategoryScreen(),
    );
  }
}
