import 'package:flutter/material.dart';

class UserRegisterationTitleText extends StatelessWidget {
  const UserRegisterationTitleText({
    Key? key,
    required this.longTextTitle,
  }) : super(key: key);
  final String longTextTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Text(
        longTextTitle,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto-Medium',
          fontSize: 34.0,
        ),
      ),
    );
  }
}
