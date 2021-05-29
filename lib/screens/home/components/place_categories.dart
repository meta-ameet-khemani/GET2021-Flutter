import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class PlaceCategories extends StatefulWidget {
  @override
  _PlaceCategoriesState createState() => _PlaceCategoriesState();
}

class _PlaceCategoriesState extends State<PlaceCategories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> places = [
      'Popular',
      'Featured',
      'Most Visited',
      'Europe',
      'Asia',
      'Africa',
      'America',
      'Australia',
    ];
    return Padding(
      padding: EdgeInsets.all(30),
      child: SizedBox(
        height: isTab(context) ? 35 : 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: places.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  this.selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  places[index],
                  style: TextStyle(
                    fontSize: isTab(context) ? 25 : 16,
                    color: selectedIndex == index ? kPrimaryColor : kTextColor,
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
