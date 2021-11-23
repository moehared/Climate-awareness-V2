import 'package:app/ui/widgets/button-widget/rounded-long-button.dart';
import 'package:app/ui/widgets/slider-widget/slider_widget.dart';
import 'package:flutter/material.dart';

class ReusableQuetionCard extends StatelessWidget {
  const ReusableQuetionCard({
    Key? key,
    required this.defaultBtn,
    required this.questionTitle,
    required this.onSliderChange,
    required this.value,
    required this.label,
    this.max = 10,
    this.step = 5,
  }) : super(key: key);
  final String questionTitle;
  final Function() defaultBtn;
  final Function(double) onSliderChange;
  final double value;
  final String label;
  final double max;
  final int step;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(questionTitle),
          ),
          SliderWidget(
            value: value,
            onChange: onSliderChange,
            label: label,
            max: max,
            step: step,
          ),
          RoundedLongButton(
            title: "I don't know",
            onPress: defaultBtn,
          ),
        ],
      ),
    );
  }
}
