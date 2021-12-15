import 'package:app/ui/widgets/button-widget/elevated-button.dart';
import 'package:app/ui/widgets/button-widget/text-button.dart';
import 'package:flutter/material.dart';

class BuildNextOrPrevQuestionWidget extends StatelessWidget {
  const BuildNextOrPrevQuestionWidget({
    Key? key,
    required this.prev,
    required this.next,
  }) : super(key: key);

  final Function() prev;
  final Function() next;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButtonWidget(
            onPress: prev,
            label: 'Previous',
            includeBorder: true,
          ),
          ElevatedButtonWidget(
            label: 'Next',
            onPress: next,
          )
        ],
      ),
    );
  }
}
