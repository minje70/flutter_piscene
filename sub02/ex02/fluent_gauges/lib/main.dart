import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:flutter/material.dart';

class GaugeWidget extends StatefulWidget {
  GaugeWidget({Key? key}) : super(key: key);

  @override
  State<GaugeWidget> createState() => _GaugeWidgetState();
}

class _GaugeWidgetState extends State<GaugeWidget> {
  double gauge = 0;

  @override
  void initState() {
    super.initState();
    gauge = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SfRadialGauge(
          axes: [
            RadialAxis(
              majorTickStyle: MajorTickStyle(color: Colors.white),
              minorTickStyle: MinorTickStyle(color: Colors.white),
              axisLabelStyle: GaugeTextStyle(color: Colors.white),
              minimum: 0,
              maximum: 150,
              ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: 50,
                    color: Colors.green,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 50,
                    endValue: 100,
                    color: Colors.orange,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 100,
                    endValue: 150,
                    color: Colors.red,
                    startWidth: 10,
                    endWidth: 10)
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: gauge,
                  needleColor: Colors.white,
                  enableAnimation: true,
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        child: Text(gauge.toString(),
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                    angle: 90,
                    positionFactor: 0.5)
              ],
            )
          ],
          enableLoadingAnimation: true,
        ),
        Slider(
          activeColor: Colors.green,
          value: gauge.toDouble(),
          onChanged: (value) {
            setState(() {
              gauge = (value * 10).floorToDouble() / 10;
            });
          },
          max: 150,
          min: 0,
        )
      ],
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  Widget _bodyWidget() {
    return Center(
      child: GaugeWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fluent Gauge',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
      ),
      body: _bodyWidget(),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.blueGrey[900],
      ),
      home: MyHome(),
    ),
  );
}
