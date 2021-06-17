import 'package:flutter/material.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:travelApp/models/place.dart';

import '../../../constants.dart';
import '../../../util.dart';
import 'liked_button.dart';

class GridPlaceCard extends StatelessWidget {
  final Place place;
  final GestureTapCallback tapBack;
  const GridPlaceCard({Key? key, required this.place, required this.tapBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapBack,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Hero(
              tag: place.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  place.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: cardInfoDecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            place.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          LikedButton(),
                        ],
                      ),
                      // SmoothStarRating(
                      //   allowHalfRating: false,
                      //   onRated: (v) {},
                      //   starCount: 5,
                      //   rating: place.rating,
                      //   size: 15,
                      //   isReadOnly: true,
                      //   color: kRatingStarColor,
                      //   borderColor: kRatingStarColor,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
