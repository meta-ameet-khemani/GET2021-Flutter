import 'package:flutter/material.dart';
import 'all_meals_by_category_screen.dart';

class CategoryItem extends StatelessWidget {

  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return CategoryMeals(title, color);
    // }));

    // named route
    Navigator.of(context).pushNamed(
      MealsByCategory.routeName,
        arguments: {'id': id, 'title': title, 'color': color},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
