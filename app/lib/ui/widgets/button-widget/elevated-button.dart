import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
    required this.label,
    required this.onPress,
  }) : super(key: key);
  final String label;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.padded,
        primary: Theme.of(context).colorScheme.secondary,
      ),
      onPressed: onPress,
      child: Text(label),
    );
  }
}
