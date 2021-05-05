import 'package:flutter/material.dart';
import 'screens/bottom_tab_bar.dart';
import 'screens/filters.dart';
import 'screens/meal_item_details.dart';
import 'screens/all_meals_by_category_screen.dart';

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
        MealsByCategory.routeName: (context) => MealsByCategory(),
        MealItemDetails.routeName: (context) => MealItemDetails(),
        Filters.routeName: (context) => Filters(),
      },
      // home: CategoryScreen(),
      // home: TopTabBars(),
      home: BottomTabBar(),
    );
  }
}
