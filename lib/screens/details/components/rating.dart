import 'package:flutter/material.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:travelApp/models/place.dart';

import '../../../constants.dart';

class Rating extends StatelessWidget {
  const Rating({
    Key? key,
    required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // SmoothStarRating(
        //   allowHalfRating: false,
        //   onRated: (v) {},
        //   starCount: 5,
        //   rating: place.rating,
        //   size: 20,
        //   isReadOnly: true,
        //   color: kRatingStarColor,
        //   borderColor: kRatingStarColor,
        // ),
        SizedBox(
          width: 5,
        ),
        Text(
          place.rating.toString(),
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
