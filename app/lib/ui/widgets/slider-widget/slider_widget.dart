import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget(
      {Key? key,
      required this.value,
      required this.onChange,
      required this.step,
      required this.max,
      required this.label})
      : super(key: key);
  final double value;
  final Function(double) onChange;
  final int step;
  final double max;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 8,
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: 12,
        ),
        rangeTickMarkShape: RoundRangeSliderTickMarkShape(
          tickMarkRadius: 1 / 6,
        ),
        valueIndicatorTextStyle: TextStyle(
          fontSize: 20,
        ),
      ),
      child: Slider.adaptive(
        divisions: step,
        label: label,
        activeColor: Theme.of(context).colorScheme.secondary,
        inactiveColor: Colors.grey,
        value: value,
        onChanged: onChange,
        max: max,
      ),
    );
  }
}