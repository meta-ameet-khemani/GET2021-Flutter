import 'package:flutter/material.dart';

class MyCheckBoxExample extends StatefulWidget {
  bool chkb1, chkb2;

  MyCheckBoxExample({this.chkb1, this.chkb2});

  @override
  _MyCheckBoxExampleState createState() => _MyCheckBoxExampleState();
}

class _MyCheckBoxExampleState extends State<MyCheckBoxExample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      alignment: Alignment.center,
      child: Container(
        child: Column(
          children: [
            Text(
              'Checkbox example (CheckBox)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Do you want to play in MPL'),
                  Checkbox(
                      value: widget.chkb1,
                      onChanged: (value) {
                        setState(() {
                          this.widget.chkb1 = value;
                        });
                      }),
                ],
              ),
            ),
            Text('${widget.chkb1}'),
            SizedBox(
              height: 30,
            ),
            Text('Checkbox example (CheckBoxTile)'),
            SizedBox(
              height: 30,
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              secondary: const Icon(Icons.alarm),
              title: const Text('Ringing at 5:00 AM every day'),
              subtitle: Text('Ringing after 12 hours'),
              value: this.widget.chkb2,
              onChanged: (bool value) {
                setState(() {
                  this.widget.chkb2 = value;
                });
              },
            ),
            SizedBox(
              height: 30,
            ),
            Text('${widget.chkb2}'),
          ],
        ),
      ),
    );
  }
}
