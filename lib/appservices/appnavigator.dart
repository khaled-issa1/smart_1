import 'package:flutter/cupertino.dart';

class AppNavigator {
  GlobalKey<NavigatorState> nsk = GlobalKey<NavigatorState>();

  AppNavigator._();

  static AppNavigator appNavigator = AppNavigator._();

  replace(String x) {
    nsk.currentState?.pushReplacementNamed(x);
  }

  push(String x) {
    nsk.currentState?.pushNamed(x);
  }
}
