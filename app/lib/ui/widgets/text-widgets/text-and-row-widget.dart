import 'package:app/ui/widgets/text-widgets/label_title_widget.dart';
import 'package:flutter/material.dart';

class BuildTitleAndHelpButton extends StatelessWidget {
  const BuildTitleAndHelpButton({
    required this.label,
    this.leftIconButton,
    required this.rightIconButton,
    this.rightIconData = Icons.help,
    this.leftIconData = Icons.remove,
    Key? key,
  }) : super(key: key);
  final String label;
  final Function()? leftIconButton;
  final Function() rightIconButton;
  final IconData? leftIconData;
  final IconData? rightIconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          this.label.length > 46
              ? Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: LabelTitleWidget(title: label),
                  ),
                )
              : LabelTitleWidget(title: label),
          Row(
            children: [
              BuildRowIconButton(
                  helpButton: rightIconButton, iconData: rightIconData),
              if (leftIconButton != null)
                BuildRowIconButton(
                    helpButton: leftIconButton!, iconData: leftIconData),
            ],
          ),
        ],
      ),
    );
  }
}

class BuildRowIconButton extends StatelessWidget {
  const BuildRowIconButton({
    Key? key,
    required this.helpButton,
    required this.iconData,
    this.hideOnClickFeedback = true,
  }) : super(key: key);

  final Function() helpButton;
  final IconData? iconData;
  final bool hideOnClickFeedback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: hideOnClickFeedback
          ? Colors.transparent
          : Theme.of(context).splashColor,
      highlightColor: hideOnClickFeedback
          ? Colors.transparent
          : Theme.of(context).splashColor,
      onPressed: helpButton,
      icon: Icon(iconData),
    );
  }
}
