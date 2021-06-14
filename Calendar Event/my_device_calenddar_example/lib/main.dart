import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  DeviceCalendarPlugin _deviceCalendarPlugin;
  List<Calendar> _calendars;
  Calendar _selectedCalendar;

  _MyHomePageState() {
    _deviceCalendarPlugin = DeviceCalendarPlugin();
  }

  @override
  void initState() {
    super.initState();
    _retrieveCalendars();
    // print(_deviceCalendarPlugin.retrieveCalendars().toString());
  }

  void _retrieveCalendars() async {
    try {
      var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
      if (permissionsGranted.isSuccess && !permissionsGranted.data) {
        permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
        if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
          return;
        }
      }

      final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
      setState(() {
        _calendars = calendarsResult?.data;
        print(_calendars);
        print(_calendars.length);
        _calendars.forEach((element) {
          print(element.id);
          print(element.name);
          if (element.id == '3') {
            print(element);
            _selectedCalendar = element;
          }
        });
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  void _incrementCounter() async {
    Event e = Event(
      _selectedCalendar.id,
      start: DateTime.now(),
      end: DateTime.now().add(Duration(minutes: 30)),
      title: 'Daily Status Meeting',
      // attendees: [
      //   Attendee(
      //     emailAddress: 'ameet.khemani@metacube.com',
      //     name: 'Ameet',
      //     role: AttendeeRole.Required,
      //   ),
      //   Attendee(
      //     emailAddress: 'ameetkhemani@gmail.com',
      //     name: 'Ameet Khemani',
      //     role: AttendeeRole.Optional,
      //   ),
      // ],
      description:
          'You all are required to preesnt 5 minutes before scheduled time.',
    );
    final response = await _deviceCalendarPlugin.createOrUpdateEvent(e);
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
