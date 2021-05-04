import 'package:flutter/material.dart';
import 'package:meals_app/screens/bottom_tab_bar.dart';
import 'package:meals_app/screens/meal_item_details.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/screens/top_tab_bar.dart';
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
        Meals.routeName: (context) => Meals(),
        MealItemDetails.routeName: (context) => MealItemDetails(),
      },
      // home: CategoryScreen(),
      // home: TopTabBars(),
      home: BottomTabBar(),
    );
  }
}
