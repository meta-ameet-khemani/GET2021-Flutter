import 'package:doctor_appointment/provider/login_logout_provider.dart';
import 'package:doctor_appointment/screen/login.dart';
import 'package:doctor_appointment/screen/register_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screen/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences _sharedPreferences;
  String userName;

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences().whenComplete(() {
      setState(() {
        userName = _sharedPreferences.get('user');
        print(userName);
      });
    });
  }

  Future<void> initializeSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginLogoutProvider>(
      create: (context) => LoginLogoutProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          LoginPage.routeName: (context) => LoginPage(),
          RegisterUser.routeName: (context) => RegisterUser(),
        },
        home: Consumer<LoginLogoutProvider>(
          builder: (context, loginLogoutProvider, child) {
            if (loginLogoutProvider.loggedIn) {
              return HomePage();
            } else {
              return LoginPage();
            }
          },
        ),
      ),
    );
  }
}
