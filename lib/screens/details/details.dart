import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import '../../components/common_button.dart';
import '../../components/custom_back_button.dart';
import '../../components/app_bar.dart';
import '../../constants.dart';
import '../../models/place.dart';
import 'components/days_chooser.dart';
import 'components/location.dart';
import 'components/place_image.dart';
import 'components/rating.dart';

class DetailsScreen extends StatelessWidget {
  final Place place;
  DetailsScreen({@required this.place});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: buildAppBar(
        context: context,
        title: '',
        actions: [],
        leading: CustomBackButton(
          back: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          PlaceImage(place: place),
          DelayedDisplay(
            delay: Duration(milliseconds: 350),
            fadingDuration: Duration(milliseconds: 800),
            slidingBeginOffset: const Offset(0, 1),
            child: Container(
              height: screenSize.height * 0.7,
              width: double.infinity,
              margin: EdgeInsets.only(top: screenSize.height * 0.35),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: SafeArea(
                  top: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Location(place: place),
                      SizedBox(
                        height: 10,
                      ),
                      Rating(place: place),
                      SizedBox(
                        height: 25,
                      ),
                      DaysChooser(),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        place.description,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "\$400",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: kPrimaryColor)),
                                TextSpan(
                                    text: "/",
                                    style: TextStyle(
                                        fontSize: 18, color: kPrimaryColor)),
                                TextSpan(
                                    text: "Package",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w800)),
                              ],
                            ),
                          ),
                          CommonButton(
                            tapEvent: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
