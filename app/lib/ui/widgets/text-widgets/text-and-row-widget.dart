import 'package:flutter/material.dart';

class TitleAndHelpButton extends StatelessWidget {
  const TitleAndHelpButton({
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
          Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
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
  }) : super(key: key);

  final Function() helpButton;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: helpButton,
      icon: Icon(iconData),
    );
  }
}
