import 'package:flutter/material.dart';

class MySnackBar extends StatefulWidget {
  @override
  _MySnackBarState createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  String buttonText = 'Change button color';

  void makesChanges () {
    setState(() {
      buttonText = 'Color changed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('Yay! A SnackBar!'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () { },
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Text('Show SnackBar At Bottom'),
          ),
          RaisedButton(
            onPressed: () {
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                width: 300,
                content: Text('Snackbar at top'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: makesChanges,
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Text(buttonText),
            color: Colors.purpleAccent,
            // style: ButtonStyle(),
          ),
        ],
      ),
    );
  }
}
