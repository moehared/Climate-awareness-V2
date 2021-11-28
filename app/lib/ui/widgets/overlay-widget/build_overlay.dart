import 'package:flutter/material.dart';

class BuildOverlayWidget extends StatelessWidget {
  const BuildOverlayWidget({
    required this.hideOverlay,
    required this.information,
    Key? key,
  }) : super(key: key);
  final Function() hideOverlay;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Material(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        elevation: 4,
        type: MaterialType.card,
        child: Container(
          width: double.infinity,
          height: 100,
          child: Text(information),
        ),
      ),
    );
  }
}
