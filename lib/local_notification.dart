import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyLocalNotificationExample extends StatefulWidget {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  MyLocalNotificationExample(this._flutterLocalNotificationsPlugin);

  @override
  _MyLocalNotificationExampleState createState() =>
      _MyLocalNotificationExampleState();
}

class _MyLocalNotificationExampleState
    extends State<MyLocalNotificationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Notifications Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showNotification,
        tooltip: 'Notification',
        child: Icon(Icons.notification_important),
      ),
    );
  }

  void showNotification() async {
    final scheduleNotificationOn = DateTime.now().add(Duration(seconds: 0));

    var androidNotificationDetails = AndroidNotificationDetails(
      'channelID', // channelID
      'channelName', // channelName
      'channelDescription', // channelDescription
      icon: 'notification_logo',
      largeIcon: DrawableResourceAndroidBitmap('notification_logo'),
    );

    var iOSNotificationDetails = IOSNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    var platformNotificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iOSNotificationDetails);

    await widget._flutterLocalNotificationsPlugin.schedule(
      0,
      'title 2',
      'body',
      scheduleNotificationOn,
      platformNotificationDetails,
    );
  }
}
