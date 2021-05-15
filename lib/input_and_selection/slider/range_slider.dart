import 'package:flutter/material.dart';

class MyRangeSlider extends StatefulWidget {
  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MyRangeSlider> {
  String sampleText = "Hello !!! Please select range";
  double initialSize = 20;
  RangeValues _rangeValues = const RangeValues(30, 70);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'Range Slider Example',
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
          RangeSlider(
            min: 0,
            max: 100,
            values: _rangeValues,
            activeColor: Colors.black,
            inactiveColor: Colors.white,
            labels: RangeLabels(
              _rangeValues.start.round().toString(),
              _rangeValues.end.round().toString(),
            ),
            divisions: 10,
            onChanged: (values) {
              setState(() {
                _rangeValues = values;
              });
            },
          ),
        ],
      ),
    );
  }
}
