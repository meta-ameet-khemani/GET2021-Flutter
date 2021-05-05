import 'package:flutter/material.dart';
import 'meal_item.dart';
import '../temp_asset/dummy_meals.dart';

class MealsByCategory extends StatefulWidget {
  static const routeName = '/category-meal';

  @override
  _MealsByCategoryState createState() => _MealsByCategoryState();
}

class _MealsByCategoryState extends State<MealsByCategory> {

  String title;
  List mealsByCategoryId;
  
  @override
  void didChangeDependencies() {
    final routeArguments = ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final id = routeArguments['id'];
    title = routeArguments['title'];
    final Color color = routeArguments['color'] as Color;

    mealsByCategoryId = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    
    super.didChangeDependencies();
  }

  void _removeItem (String mealId) {
    setState(() {
      mealsByCategoryId.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              child: MealItem(
                mealsByCategoryId[index].id,
                mealsByCategoryId[index].title,
                mealsByCategoryId[index].duration.toString(),
                mealsByCategoryId[index].imageUrl,
                mealsByCategoryId[index].complexity,
                mealsByCategoryId[index].affordability,
                _removeItem,
              ),// Text('${mealsByCategoryId[index].title}'),
            );
          },
          itemCount: mealsByCategoryId.length,
        ),
      ),
    );
  }
}
