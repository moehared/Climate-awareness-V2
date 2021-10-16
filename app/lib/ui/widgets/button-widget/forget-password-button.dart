// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Forget password?",
          style: TextStyle(
            color: Color(0xff112BF4),
            fontFamily: "Roboto-Regular",
            fontSize: 20,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
