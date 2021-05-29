import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travelApp/models/place.dart';

class Location extends StatelessWidget {
  const Location({
    Key key,
    @required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/location_pin.svg',
          width: 12,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          place.location,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
