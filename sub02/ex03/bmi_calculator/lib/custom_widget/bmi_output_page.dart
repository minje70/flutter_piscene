import 'dart:math';

import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:flutter/material.dart';

class OutputPage extends StatelessWidget {
  const OutputPage({Key? key, required this.height, required this.weight})
      : super(key: key);
  final double height;
  final double weight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: GaugeWidget(
        height: height,
        weight: weight,
      ),
    );
  }
}

class GaugeWidget extends StatefulWidget {
  const GaugeWidget({Key? key, required this.height, required this.weight})
      : super(key: key);
  final double height;
  final double weight;

  @override
  State<GaugeWidget> createState() => _GaugeWidgetState();
}

class _GaugeWidgetState extends State<GaugeWidget> {
  double gauge = 0;

  double _calculateBMI(double height, double weight) {
    // height : cm
    // weight : kg
    // BMI = weight / height^2
    double result = weight / pow(height / 100, 2);
    return (result * 10).floorToDouble() / 10;
  }

  @override
  void initState() {
    super.initState();
    gauge = _calculateBMI(widget.height, widget.weight);
  }

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          minimum: 0,
          maximum: 45,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: 18.5,
              color: Colors.blue,
              label: '저체중',
              startWidth: 20,
              endWidth: 20,
            ),
            GaugeRange(
                startValue: 18.5,
                endValue: 25,
                color: Colors.green,
                label: '정상',
                startWidth: 20,
                endWidth: 20),
            GaugeRange(
              startValue: 25,
              endValue: 30,
              color: Colors.orange,
              label: '과체중',
              startWidth: 20,
              endWidth: 20,
            ),
            GaugeRange(
              startValue: 30,
              endValue: 35,
              color: Color.fromARGB(255, 255, 94, 0),
              label: '비만',
              startWidth: 20,
              endWidth: 20,
            ),
            GaugeRange(
              startValue: 35,
              endValue: 45,
              color: Colors.red,
              label: '고도 비만',
              startWidth: 20,
              endWidth: 20,
            )
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: gauge,
              enableAnimation: true,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Container(
                child: Text(
                  'BMI: ${gauge.toString()}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              angle: 90,
              positionFactor: 0.5,
            )
          ],
        )
      ],
      enableLoadingAnimation: true,
    );
  }
}
