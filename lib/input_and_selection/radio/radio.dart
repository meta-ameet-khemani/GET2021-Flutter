import 'package:flutter/material.dart';

enum _Domain {
  JAVA,
  PYTHON,
  AWS,
  MOBILE_APPS,
}

class MyRadio extends StatefulWidget {
  @override
  _MyRadioState createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  _Domain _selectedValue = _Domain.JAVA;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'Radio Button Example',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          ListTile(
            title: Text('Java(Spring + Angular)'),
            leading: Radio(
              activeColor: Colors.black,
              value: _Domain.JAVA,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  print(value);
                  _selectedValue = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Python(Django)'),
            leading: Radio(
              activeColor: Colors.black,
              value: _Domain.PYTHON,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  print(value);
                  _selectedValue = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('AWs'),
            leading: Radio(
              activeColor: Colors.black,
              value: _Domain.AWS,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  print(value);
                  _selectedValue = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Mobile Apps (Flutter + Android + Swift)'),
            leading: Radio(
              activeColor: Colors.black,
              value: _Domain.MOBILE_APPS,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  print(value);
                  _selectedValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
