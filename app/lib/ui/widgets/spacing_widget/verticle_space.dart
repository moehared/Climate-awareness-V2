import 'package:flutter/material.dart';

class BuildSpacing extends StatelessWidget {
  const BuildSpacing({
    Key? key,
    this.verticalSpace = true,
    this.space,
  }) : super(key: key);

  /// default spacing is vertical set to true
  final bool verticalSpace;
  final double? space;
  @override
  Widget build(BuildContext context) {
    if (verticalSpace) {
      return SizedBox(height: space ?? 10);
    }
    return SizedBox(width: space ?? 10);
  }
}
