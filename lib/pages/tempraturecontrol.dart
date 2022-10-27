import 'package:flutter/material.dart';
import 'package:smart_1/backend/FirebaseHelper.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TempretureControlPage extends StatefulWidget {
  static String routeName = 'TempretureControlPage';

  @override
  _TempretureControlPageState createState() => _TempretureControlPageState();
}

class _TempretureControlPageState extends State<TempretureControlPage> {
  double tempdeg = 30;

  Color c1 = Color.fromRGBO(21, 72, 84, 1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Tempreature Control',
            style: TextStyle(color: c1),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: c1,
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            SfRadialGauge(
              axes: [
                RadialAxis(
                  minorTicksPerInterval: 4,
                  minimum: -60,
                  maximum: 60,
                  interval: 10,
                  startAngle: 115,
                  endAngle: 65,
                  pointers: [
                    NeedlePointer(
                      value: tempdeg,
                      onValueChanged: (z) {
                        tempdeg = z;
                        setState(() {});
                      },
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Text(
                          '${tempdeg}°C',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        positionFactor: 0.8,
                        angle: 90)
                  ],
                )
              ],
              //backgroundColor: Color.fromRGBO(21, 72, 84, 1),
            ),
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () async {
                  if (tempdeg >= 40) {
                    tempdeg = 30;
                    FirebaseHelper.firebaseHelper.setTemp(tempdeg);
                  } else {
                    tempdeg += 2;
                    FirebaseHelper.firebaseHelper.setTemp(tempdeg);
                  }
                  setState(() {});
                }),
            SizedBox(
              height: 75,
            ),
          ],
        ));
  }
}
