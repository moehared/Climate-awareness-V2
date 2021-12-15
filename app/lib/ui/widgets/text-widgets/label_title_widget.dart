import 'package:app/common/styles/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LabelTitleWidget extends StatelessWidget {
  const LabelTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        title,
        style: TextStyle(fontFamily: 'Roboto-Bold'),
      ),
    );
  }
}

class BuildRichText extends StatelessWidget {
  const BuildRichText({
    Key? key,
    required this.label,
    required this.linkLabel,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final String linkLabel;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: linkLabel,
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
