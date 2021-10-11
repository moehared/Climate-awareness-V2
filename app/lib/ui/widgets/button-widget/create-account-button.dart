import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: [
            TextSpan(
              text: "don'\tt have account? ",
              style: TextStyle(fontFamily: 'Roboto-Regular', fontSize: 18),
            ),
            TextSpan(
              text: 'Sign up',
              recognizer: TapGestureRecognizer()..onTap = () {},
              style: TextStyle(
                fontFamily: 'Roboto-Regular',
                fontSize: 18,
                decoration: TextDecoration.underline,
                color: Color(0xff112BF4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
