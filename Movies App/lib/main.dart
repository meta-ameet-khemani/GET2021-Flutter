import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/providers/movie_category_provider.dart';
import '../providers/movie_backdrop_provider.dart';
import 'package:provider/provider.dart';
import '../themes/app_color.dart';
import 'core_services/log_service.dart';
import 'providers/post_provider.dart';
import 'screens/home_page.dart';
import 'core_services/gateway_service.dart';
import 'core_services/service_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runZonedGuarded(() {
      runApp(MyApp());
    }, (error, stackTrace) {
      Log.instance.log(error, stackTrace: stackTrace);
    });
  });
  // runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Gateway? gateway;
  // IApi? api;

  MyApp() {
    gateway = Gateway(ServiceConfig());
    // api = ApiServices(gateway);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PostProvider(gateway),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieBackdropProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieCategoryProvider(),
        ),
      ],
      child: MaterialApp(
        home: MyHomePage(this.gateway),
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          primaryColor: AppColor.vulcan,
          scaffoldBackgroundColor: AppColor.vulcan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // textTheme: ThemeText.getTextTheme(),
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
      ),
    );
  }
}
