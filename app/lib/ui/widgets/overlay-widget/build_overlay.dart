import 'package:flutter/material.dart';

class BuildOverlayWidget extends StatelessWidget {
  const BuildOverlayWidget({
    required this.hideOverlay,
    Key? key,
  }) : super(key: key);
  final Function() hideOverlay;
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
          height: 200,
          child: ListView.builder(
            itemBuilder: (ctx, index) => ListTile(
              title: Text('${index + 1}'),
              onTap: () {
                hideOverlay();
              },
            ),
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
