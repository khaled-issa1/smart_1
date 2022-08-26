import "package:flutter/material.dart";
import 'package:smart_1/appservices/appnavigator.dart';

import 'package:smart_1/pages/ongoingpage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  moveMethode() async {
    await Future.delayed(const Duration(seconds: 3));
    AppNavigator.appNavigator.replace(OnGoingPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    moveMethode();

    return const Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image(
            image: AssetImage('images/shh.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
