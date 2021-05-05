import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'meal_item.dart';

class Favourites extends StatelessWidget {

  final List<Meal> favoriteMeals;

  Favourites(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: MealItem(
              favoriteMeals[index].id,
              favoriteMeals[index].title,
              favoriteMeals[index].duration.toString(),
              favoriteMeals[index].imageUrl,
              favoriteMeals[index].complexity,
              favoriteMeals[index].affordability,
            ),// Text('${mealsByCategoryId[index].title}'),
          );
        },
        itemCount: favoriteMeals.length,
      ),
    );
  }
}
