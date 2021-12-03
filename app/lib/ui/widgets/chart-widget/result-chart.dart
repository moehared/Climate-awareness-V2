import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultChart extends StatelessWidget {
  final double res;

  ResultChart(this.res);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Container(
        height: media.size.height * 0.20,
        width: media.size.width * 0.40,
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(minimum: 0, maximum: 2.5, ranges: <GaugeRange>[
              GaugeRange(startValue: 0, endValue: 1, color: Colors.green),
              GaugeRange(
                  startValue: 1, endValue: 1.4, color: Colors.yellow.shade700),
              GaugeRange(
                  startValue: 1.4, endValue: 2.5, color: Colors.red.shade900)
            ], pointers: <GaugePointer>[
              NeedlePointer(
                value: res,
                needleLength: 0.4,
                needleColor: Theme.of(context).colorScheme.secondary,
                knobStyle: KnobStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ], annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Container(
                  width: 100,
                  height: 25,
                  child: FittedBox(
                    child: Text(
                      '${res.toStringAsFixed(2)} tons\nCO2eq/month',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                angle: 90,
                positionFactor: 0.8,
              ),
            ]),
          ],
        ));
  }
}
