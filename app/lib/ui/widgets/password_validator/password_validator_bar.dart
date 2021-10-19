import 'package:flutter/material.dart';

class PassWordValidatorBar extends StatelessWidget {
  const PassWordValidatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,

      child: Row(
        children: List.generate(4, (index) => RowBarWidget(index: index)),
      ),
    );
  }
}

class RowBarWidget extends StatelessWidget {
  const RowBarWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: index == currentIndex ? Colors.white : Colors.grey.shade900,
        // shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).primaryColor, width: 1),
      ),
      height: 10,
      width: 50,
      // color: Colors.red,
    );
  }
}
