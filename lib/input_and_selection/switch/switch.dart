import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'Switch Example',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Switch(
            value: _isSwitchOn,
            activeColor: Colors.yellow,
            hoverColor: Colors.black,
            onChanged: (value) {
              setState(() {
                print(value);
                _isSwitchOn = value;
              });
            },
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '$_isSwitchOn',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
