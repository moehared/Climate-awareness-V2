// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "Forget password?",
          style: TextStyle(
            // color: Color(0xff112BF4),
            color: Colors.black,
            backgroundColor: Colors.blueAccent.shade100,
            fontFamily: "Roboto-Regular",
            fontSize: 20,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
