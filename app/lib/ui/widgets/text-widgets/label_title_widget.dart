import 'package:flutter/material.dart';

class LabelTitleWidget extends StatelessWidget {
  const LabelTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontFamily: 'Roboto-Bold'),
    );
  }
}
