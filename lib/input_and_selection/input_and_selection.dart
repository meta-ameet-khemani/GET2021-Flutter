import 'package:flutter/material.dart';

import 'radio/radio.dart';
import 'slider/range_slider.dart';
import 'slider/slider.dart';
import 'switch/switch.dart';
import 'textfield/textfield.dart';
import 'checkbox/my_checkbox.dart';
import 'date_and_time_picker/date_and_time_picker.dart';

class MyInputAndSelection extends StatefulWidget {
  @override
  _MyInputAndSelectionState createState() => _MyInputAndSelectionState();
}

class _MyInputAndSelectionState extends State<MyInputAndSelection> {
  bool chkb1 = false;
  bool chkb2 = false;

  final PageController pageController = new PageController(
    initialPage: 7,
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Input and selection widget example'),
        ),
        body: Center(
          child: Container(
            height: 400,
            child: PageView(
              // reverse: true,
              controller: pageController,
              children: [
                MyCheckBoxExample(
                  chkb1: chkb1,
                  chkb2: chkb2,
                ),
                MyDateAndTimePicker(),
                MyRadio(),
                MySlider(),
                MyRangeSlider(),
                MySwitch(),
                MyTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
