import 'package:flutter/material.dart';

class TitleAndHelpButton extends StatelessWidget {
  const TitleAndHelpButton({
    required this.label,
    required this.helpButton,
    Key? key,
  }) : super(key: key);
  final String label;
  final Function() helpButton;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          IconButton(
            onPressed: helpButton,
            icon: Icon(Icons.help),
          )
        ],
      ),
    );
  }
}
