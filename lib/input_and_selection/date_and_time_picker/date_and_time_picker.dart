import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateAndTimePicker extends StatefulWidget {
  @override
  _MyDateAndTimePickerState createState() => _MyDateAndTimePickerState();
}

class _MyDateAndTimePickerState extends State<MyDateAndTimePicker> {
  String _selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String _selectedTime = DateFormat('hh:mm').format(DateTime.now());

  Future<Null> _changeDate(BuildContext context) async {
    final DateTime changedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (changedDate != null &&
        DateFormat('dd/MM/yyyy').format(changedDate) != _selectedDate) {
      setState(() {
        _selectedDate = DateFormat('dd/MM/yyyy').format(changedDate);
      });
    }
  }

  Future<Null> _changeTime(BuildContext context) async {
    final TimeOfDay changedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(DateFormat('hh').format(DateTime.now())),
        minute: int.parse(DateFormat('mm').format(DateTime.now())),
      ),
    );
    if (changedTime != null && changedTime.toString() != _selectedTime) {
      setState(() {
        // _selectedTime = changedTime.toString();
        _selectedTime =
            changedTime.hour.toString() + ":" + changedTime.minute.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Click for selecting date'),
          InkWell(
            onTap: () => _changeDate(context),
            child: Container(
              width: 250,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              child: Text(
                '$_selectedDate',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text('Click for selecting time'),
          InkWell(
            onTap: () => _changeTime(context),
            child: Container(
              width: 250,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              child: Text(
                '$_selectedTime',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
