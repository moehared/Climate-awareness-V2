import 'package:flutter/material.dart';

class LogoImageAvatar extends StatelessWidget {
  const LogoImageAvatar({
    Key? key,
    required this.imageAsset,
    this.isCircle = false,
  }) : super(key: key);
  final String imageAsset;
  final bool isCircle;
  @override
  Widget build(BuildContext context) {
    if (isCircle) {
      return CircleAvatar(
        radius: 20,
        child: Image.asset(imageAsset),
      );
    }
    return SizedBox(
      // width: double.infinity,
      // height: 800 * 0.2,
      child: Align(
        child: Image.asset(imageAsset),
      ),
    );
  }
}
