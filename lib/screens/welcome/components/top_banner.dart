import 'package:flutter/material.dart';
import 'package:travelApp/responsive.dart';

class TopBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * (isTab(context) ? 0.6 : 0.5),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Image.asset(
          'assets/images/welcome.jpg',
          height: screenSize.height * 0.5,
          width: screenSize.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
