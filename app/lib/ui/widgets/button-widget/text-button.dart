import 'package:app/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    Key? key,
    this.includeBorder = false,
    required this.onPress,
    required this.label,
    this.isBusy = false,
  }) : super(key: key);
  final bool includeBorder;
  final Function()? onPress;
  final String label;
  final bool isBusy;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        side: includeBorder
            ? BorderSide(
                color: Colors.grey,
              )
            : null,
        tapTargetSize: MaterialTapTargetSize.padded,
        primary: Theme.of(context).colorScheme.secondary,
      ),
      onPressed: onPress,
      child: isBusy ? Loading() : Text(label),
    );
  }
}
