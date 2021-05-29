import 'package:flutter/material.dart';
import '../../../models/place.dart';

class PlaceImage extends StatelessWidget {
  const PlaceImage({
    Key key,
    @required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.4,
      child: Hero(
        tag: place.id,
        child: Image.asset(
          place.image,
          height: screenSize.height * 0.4,
          width: screenSize.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
