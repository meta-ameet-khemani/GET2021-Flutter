import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic Alert Box'),
          centerTitle: true,
        ),
        body: AlertDialogImplementaion(),
      ),
    );
  }
}

class AlertDialogImplementaion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Show Alert Box'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Confirmation'),
                content:
                    Text('Are you sure about this. Do you want to continue ?'),
                actions: [
                  RaisedButton(
                    onPressed: () {},
                    child: Text('Ok'),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
