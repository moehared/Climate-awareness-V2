import 'package:flutter/material.dart';

// ignore_for_file: file_names
class RoundedLongButton extends StatelessWidget {
  const RoundedLongButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.isBusy = false,
  }) : super(key: key);
  final String title;
  final Function()? onPress;
  final bool isBusy;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.secondary,
          tapTargetSize: MaterialTapTargetSize.padded,
          shape: RoundedRectangleBorder(
            side: onPress == null
                ? BorderSide(color: Colors.grey)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        onPressed: onPress,
        child: isBusy
            ? CircularProgressIndicator()
            : Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Roboto-Regular",
                  fontSize: 20,
                ),
              ),
      ),
    );
  }
}
