import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

enum TempChange { cooling, heatineg, normal }

class TempretureControlPage extends StatefulWidget {
  static String routeName = 'TempretureControlPage';

  @override
  _TempretureControlPageState createState() => _TempretureControlPageState();
}

class _TempretureControlPageState extends State<TempretureControlPage> {
  double tempdeg = 27;
  TempChange tempChange = TempChange.normal;
  Color c1 = Color.fromRGBO(21, 72, 84, 1);

  tempButtons() async {
    bool c = false;
    bool h = true;
    if (c == false && h == false) {
      tempChange = TempChange.normal;
    } else if (c == true && h == false) {
      tempChange = TempChange.cooling;
    } else if (c == false && h == true) {
      tempChange = TempChange.heatineg;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tempButtons();
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
                          '°C',
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
                  tempdeg = 37;
                  setState(() {});
                }),
            SizedBox(
              height: 75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () async {
                    tempChange = TempChange.heatineg;
                    setState(() {});
                  },
                  child: Container(
                      width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: tempChange == TempChange.heatineg
                            ? Colors.green
                            : Colors.grey,
                      ),
                      child: Center(
                          child: Text(
                        'Run \nHeating Device',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ))),
                ),
                GestureDetector(
                  onTap: () async {
                    tempChange = TempChange.normal;
                    setState(() {});
                  },
                  child: Container(
                      width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: tempChange == TempChange.normal
                            ? Colors.green
                            : Colors.grey,
                      ),
                      child: Center(
                          child: Text(
                        "Don't Run",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ))),
                ),
                GestureDetector(
                  onTap: () async {
                    tempChange = TempChange.cooling;
                    setState(() {});
                  },
                  child: Container(
                      width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: tempChange == TempChange.cooling
                            ? Colors.green
                            : Colors.grey,
                      ),
                      child: const Center(
                          child: Text(
                        'Run \nCooling Device',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ))),
                )
              ],
            )
          ],
        ));
  }
}
