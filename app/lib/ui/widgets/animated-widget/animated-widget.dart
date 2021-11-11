import 'package:flutter/material.dart';

class AnimatedProgressBar extends AnimatedWidget {
  AnimatedProgressBar({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Container(
      height: 10.0,
      width: animation.value,
      decoration: BoxDecoration(color: Theme.of(context).accentColor),
    );
  }
}
