import 'package:flutter/material.dart';
import 'models/meal.dart';
import 'temp_asset/dummy_meals.dart';
import 'screens/bottom_tab_bar.dart';
import 'screens/filters.dart';
import 'screens/meal_item_details.dart';
import 'screens/all_meals_by_category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filterOptions = {
    'curd' : false,
    'vegan' : false,
    'vegetarian' : false,
    'oil' : false
  };
  List<Meal> _allMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  @override
  Widget build(BuildContext context) {

    void _setFilterOptions (Map<String, bool> filterOptions) {

      setState(() {
        _filterOptions = filterOptions;
        _allMeals = DUMMY_MEALS.where((meal) {
          if (_filterOptions['oil'] && !meal.isOilFree) {
            return false;
          }
          if (_filterOptions['curd'] && !meal.isCurdFree) {
            return false;
          }
          if (_filterOptions['vegan'] && !meal.isVegan) {
            return false;
          }
          if (_filterOptions['vegetarian'] && !meal.isVegetarian) {
            return false;
          }
          return true;
        }).toList();
      });
    }

    void _toggleFavorite (String mealId) {
      final existingIndex =
      _favoriteMeals.indexWhere((meal) => meal.id == mealId);
      if (existingIndex >= 0) {
        setState(() {
          _favoriteMeals.removeAt(existingIndex);
        });
      } else {
        setState(() {
          _favoriteMeals.add(
            DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
          );
        });
      }
    }

    bool _isFavourite (String mealId) {
      return _favoriteMeals.any((meal) => meal.id == mealId);
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => BottomTabBar(_favoriteMeals),
        MealsByCategory.routeName: (context) => MealsByCategory(_allMeals),
        MealItemDetails.routeName: (context) => MealItemDetails(_toggleFavorite, _isFavourite),
        Filters.routeName: (context) => Filters(_filterOptions, _setFilterOptions),
      },
      // home: CategoryScreen(),
      // home: TopTabBars(),
      // home: BottomTabBar(),
    );
  }
}
