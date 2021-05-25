import 'package:check_features/my-google_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'image_picker_demo.dart';
import 'photo_list.dart';
import 'shared_preference_demo.dart';
import 'url_launcher.dart';
import 'my_path_provider.dart';
import 'local_notification.dart';

// 1. Initialize flutterLocalNotificationPlugin
final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Load all flutter's widget bindings
  WidgetsFlutterBinding.ensureInitialized();

  // 3. Initialize notification settings for android
  final androidInitializationSettings =
      AndroidInitializationSettings('notification_logo');

  // 4. Initialize notification settings for IOS
  final iosInitializationSettings = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});

  // 5. Register both platform settings [system will automatically get one of these]
  final initializationSettings = InitializationSettings(
      android: androidInitializationSettings, iOS: iosInitializationSettings);

  // 6. register the settings in plugin variable
  await _flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint('Notification payload : $payload');
      }
    },
  );

  // 7. Setup android manifest file

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final PageController pageController = PageController(
    initialPage: 6,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          controller: pageController,
          children: [
            MySharedPreferenceExample(),
            UrlLauncher(),
            MyImagePicker(),
            MyLocalNotificationExample(_flutterLocalNotificationsPlugin),
            PhotosList(),
            MyPathProvider(CounterStorage()),
            MyGoogleMapsDemo(),
          ],
        ),
      ),
    );
  }
}
