import 'package:flutter/material.dart';
import 'package:travelApp/constants.dart';
import '../../../responsive.dart';
import '../../../screens/home/components/place_card.dart';
import '../../../models/place.dart';

class PopularPlaces extends StatefulWidget {
  const PopularPlaces({
    Key key,
  }) : super(key: key);

  @override
  _PopularPlacesState createState() => _PopularPlacesState();
}

class _PopularPlacesState extends State<PopularPlaces> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: isTab(context) ? 450 : 260,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentSlider = value;
                });
              },
              controller: PageController(
                viewportFraction: isTab(context) ? 0.9 : 0.8,
                initialPage: 0,
              ),
              itemCount: demoPlaces.length,
              itemBuilder: (context, index) {
                return PlaceCard(
                  place: demoPlaces[index],
                );
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                demoPlaces.length,
                (index) => buildDotNav(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDotNav(int index) {
    return AnimatedContainer(
      duration: Duration(microseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentSlider == index ? 24 : 6,
      decoration: BoxDecoration(
        color: currentSlider == index
            ? kPrimaryColor
            : kPrimaryColor.withAlpha(70),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
