import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'meal_item_details.dart';

class MealItem extends StatelessWidget {

  final String id;
  final String title;
  final String duration;
  final String imageURL;
  final Complexity complexity;
  final Affordability affordability;
  // final Function removeItem;

  MealItem(
      this.id,
      this.title,
      this.duration,
      this.imageURL,
      this.complexity,
      this.affordability,
      // this.removeItem
  );

  String get getComplexity {
    switch(complexity) {
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Simple:
        return 'Simple';
      default:
        return 'Unknown';
    }
  }

  String get getAffordability {
    switch(affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  void mealItemDetailsById(BuildContext context) {
    Navigator.of(context).pushNamed(
        MealItemDetails.routeName,
        arguments: id,
    ).then((result) => {
      // if (result != null) removeItem(result)
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => mealItemDetailsById(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 350,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                      ),
                      softWrap: true, // if title extends width, should it comes in new line
                      overflow: TextOverflow.fade, // didn't get much of this
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule, size: 25,),
                      SizedBox(width: 5),
                      Text(
                        '$duration min',
                        style: TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5),
                      Text(
                        '$getAffordability',
                        style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work_outline_sharp),
                      SizedBox(width: 5),
                      Text(
                        '$getComplexity',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
