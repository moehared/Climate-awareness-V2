import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key,this.color = Colors.white}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      color: color,
    );
  }
}
