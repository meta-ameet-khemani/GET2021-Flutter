import 'package:flutter/material.dart';
import '../temp_asset/dummy_meals.dart';

class MealItemDetails extends StatelessWidget {

  static String routeName = '/meal-item-details';

  @override
  Widget build(BuildContext context) {

    final id = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(meal.imageUrl),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Ingredients',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.black),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                height: 100,
                width: 250,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      elevation: 10,
                      child: Text(
                        meal.ingredients[index],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.yellowAccent),
                      ),
                    );
                  },
                  itemCount: meal.ingredients.length,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Steps',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.black),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 7),
                height: 100,
                width: 250,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(meal.steps[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                        ),
                        Divider(color: Colors.black, height: 1,thickness: 1.5,),
                      ],
                    );
                  },
                  itemCount: meal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.delete),
        onPressed: () { Navigator.of(context).pop(id); },
      ),
    );
  }
}
