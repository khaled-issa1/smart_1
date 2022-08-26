import 'package:flutter/material.dart';
import 'package:smart_1/appservices/appnavigator.dart';
import 'package:smart_1/pages/doorcontrolpage.dart';
import 'package:smart_1/pages/lightcontrolpage.dart';
import 'package:smart_1/pages/tempraturecontrol.dart';

class HomePage extends StatelessWidget {
  static String routeName = 'HomePage';
  List<String> mainHomeCategory = ['Light', 'Temprature', 'Door'];
  List<String> imageNames = [
    'light.jpeg',
    'temp.jpg',
    'door.jpg',
  ];
  Color c1 = Color.fromRGBO(21, 72, 84, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(color: c1),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: c1,
          ),
        ),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  if (i == 0) {
                    AppNavigator.appNavigator.push(LightControlPage.routeName);
                  } else if (i == 1) {
                    AppNavigator.appNavigator
                        .push(TempretureControlPage.routeName);
                  } else if (i == 2) {
                    AppNavigator.appNavigator.push(DoorControlPage.routeName);
                  }
                },
                child: Stack(children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage('images/${imageNames[i]}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    left: 6,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      alignment: Alignment.center,
                      height: 100,
                      width: 50,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      child: RotatedBox(
                        quarterTurns: 135,
                        child: Text(
                          mainHomeCategory[i],
                          style:
                              TextStyle(color: c1, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ]),
              );
            }));
  }
}
