import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        "Forget password?",
        style: TextStyle(
          color: Color(0xff112BF4),
          fontFamily: "Roboto-Regular",
          fontSize: 20,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
