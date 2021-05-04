import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_item.dart';
import 'package:meals_app/temp_asset/dummy_category_items.dart';
import 'package:meals_app/temp_asset/dummy_meals.dart';

class Meals extends StatelessWidget {
  static String routeName = '/category-meal';

  // final Color color;
  // final String title;
  //
  // CategoryMeals(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final id = routeArguments['id'];
    final title = routeArguments['title'];
    final Color color = routeArguments['color'] as Color;
    final mealsByCategoryId = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${title} Meals',
          style: TextStyle(
            // backgroundColor: color,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
        ),
        // backgroundColor: color,
        // backgroundColor: Colors.tealAccent,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              child: MealItem(mealsByCategoryId[index].id, mealsByCategoryId[index].title, mealsByCategoryId[index].duration.toString(), mealsByCategoryId[index].imageUrl, mealsByCategoryId[index].complexity, mealsByCategoryId[index].affordability),// Text('${mealsByCategoryId[index].title}'),
            );
          },
          itemCount: mealsByCategoryId.length,
        ),
      ),
    );
  }
}
