import 'package:app/ui/widgets/button-widget/login-sign-button.dart';
import 'package:flutter/material.dart';

class ReusableQuetionCard extends StatelessWidget {
  const ReusableQuetionCard({
    Key? key,
    required this.defaultBtn,
    required this.questionTitle,
    required this.onSliderChange,
    required this.value,
  }) : super(key: key);
  final String questionTitle;
  final Function() defaultBtn;
  final Function(double) onSliderChange;
  final double value;
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
          Slider.adaptive(
            value: value,
            onChanged: onSliderChange,
            max: 10,
          ),
          LoginOrSignUpButton(
            title: "I don't know",
            onPress: defaultBtn,
          ),
        ],
      ),
    );
  }
}
