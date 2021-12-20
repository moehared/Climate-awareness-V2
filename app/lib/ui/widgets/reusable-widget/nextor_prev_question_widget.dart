import 'package:app/ui/widgets/button-widget/elevated-button.dart';
import 'package:app/ui/widgets/button-widget/text-button.dart';
import 'package:flutter/material.dart';

class BuildNextOrPrevQuestionWidget extends StatelessWidget {
  const BuildNextOrPrevQuestionWidget({
    Key? key,
    required this.prev,
    required this.next,
    this.disabled = true,
    this.hideNextBtn = false,
    this.hidePrevBtn = false,
  }) : super(key: key);

  final Function() prev;
  final Function() next;

  /// we can disabled btn and hide for validation purpose
  final bool disabled;
  final bool hidePrevBtn;
  final bool hideNextBtn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!hidePrevBtn)
            TextButtonWidget(
              onPress: prev,
              label: 'Previous',
              includeBorder: true,
            ),
          if (hidePrevBtn) Container(),
          if (!hideNextBtn)
            ElevatedButtonWidget(
              label: 'Next',
              onPress: disabled ? next : null,
            )
        ],
      ),
    );
  }
}
