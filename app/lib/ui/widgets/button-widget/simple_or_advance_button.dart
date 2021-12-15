import 'package:app/common/styles/style.dart';
import 'package:flutter/material.dart';

class BuildSimpleOrAdvanceWidget extends StatelessWidget {
  const BuildSimpleOrAdvanceWidget({
    Key? key,
    this.isSimple = true,
    required this.onAdvanceClick,
    required this.onSimpleClick,
  }) : super(key: key);
  final Function() onAdvanceClick;
  final Function() onSimpleClick;
  final bool isSimple;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onAdvanceClick,
          child: Container(
            decoration: kSimpleOrAdvanceContainerStyle.copyWith(
              color: isSimple ? Colors.green : Colors.white,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Text(
              'Simple',
              style: isSimple ? Theme.of(context).textTheme.bodyText1 : null,
            ),
          ),
        ),
        GestureDetector(
          onTap: onSimpleClick,
          child: Container(
            decoration: kSimpleOrAdvanceContainerStyle.copyWith(
              color: !isSimple ? Colors.green : Colors.white,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Text(
              'Advance',
              style: !isSimple ? Theme.of(context).textTheme.bodyText1 : null,
            ),
          ),
        ),
      ],
    );
  }
}
