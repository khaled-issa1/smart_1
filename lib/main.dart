import 'package:flutter/material.dart';
import 'package:smart_1/appservices/appnavigator.dart';
import 'package:smart_1/pages/doorcontrolpage.dart';
import 'package:smart_1/pages/homepage.dart';
import 'package:smart_1/pages/lightcontrolpage.dart';
import 'package:smart_1/pages/ongoingpage.dart';
import 'package:smart_1/pages/splashpage.dart';
import 'package:smart_1/pages/tempraturecontrol.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.appNavigator.nsk,
      routes: {
        OnGoingPage.routeName: (context) => OnGoingPage(),
        HomePage.routeName: (context) => HomePage(),
        LightControlPage.routeName: (context) => LightControlPage(),
        TempretureControlPage.routeName: (context) => TempretureControlPage(),
        DoorControlPage.routeName: (context) => DoorControlPage(),
      },
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
