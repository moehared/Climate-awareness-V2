import 'package:app/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
    required this.label,
    required this.onPress,
    this.isBusy = false,
  }) : super(key: key);
  final String label;
  final Function()? onPress;
  final bool isBusy;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.padded,
        primary: Theme.of(context).colorScheme.secondary,
      ),
      onPressed: onPress,
      child: isBusy ? Loading() : Text(label),
    );
  }
}
