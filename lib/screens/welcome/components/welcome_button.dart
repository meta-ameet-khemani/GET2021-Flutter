import 'package:flutter/material.dart';
import 'package:travelApp/responsive.dart';

import '../../../constants.dart';

class WelcomeButton extends StatelessWidget {
  final GestureTapCallback letsGO;

  const WelcomeButton({Key key, @required this.letsGO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isLandscape(context)
          ? EdgeInsets.symmetric(vertical: 38, horizontal: 72)
          : EdgeInsets.all(38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Winter Vacation Trips',
            style: TextStyle(
              fontSize: isTab(context) ? 45 : 36,
              fontWeight: FontWeight.w700,
              color: kTextColor,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Enjoy your winter vacations with warmth and amazing sightscreen on the mountains. Enjoy the best experience with us!',
            style: TextStyle(
              fontSize: isTab(context) ? 24 : 16,
              color: kTextColor,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: this.letsGO,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: kPrimaryColor,
              ),
              width: isTab(context) ? 300 : 200,
              height: isTab(context) ? 70 : 50,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lets Go',
                      style: TextStyle(
                        fontSize: isTab(context) ? 25 : 16,
                        color: Colors.white,
                      ),
                    ),
                    Image.asset(
                      'assets/images/arrow.png',
                      fit: BoxFit.scaleDown,
                      height: isTab(context) ? 30 : 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
