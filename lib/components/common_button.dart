import 'package:flutter/material.dart';

import '../constants.dart';

class CommonButton extends StatelessWidget {
  final GestureTapCallback tapEvent;
  const CommonButton({Key key, @required this.tapEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapEvent,
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: kPrimaryColor),
        width: 150,
        height: 50,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Text(
            'Book Now',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
