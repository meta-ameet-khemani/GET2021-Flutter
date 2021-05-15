import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  String sampleText = "Hello !!! This will get size as you give";
  double initialSize = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'Slider Example',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            '$sampleText',
            style: TextStyle(fontSize: initialSize),
          ),
          SizedBox(
            height: 40,
          ),
          Slider(
            min: 0,
            max: 40,
            value: initialSize,
            activeColor: Colors.black,
            inactiveColor: Colors.white,
            label: '$initialSize',
            divisions: 10,
            onChanged: (size) {
              setState(() {
                initialSize = size;
              });
            },
          ),
          Text(
            'Select font size',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
