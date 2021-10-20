// ignore_for_file: file_names

import 'package:app/common/enums/view_state.dart';
import 'package:app/domain/viewmodel/user-registeration-view-model/user_registeration_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    Key? key,
    required this.model,
  }) : super(key: key);
  final UserRegisterationViewModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: [
            TextSpan(
              text: model.authMode == AuthMode.LOGIN
                  ? "don'\tt have account? "
                  : "Already have an Acount?",
              style:
                  const TextStyle(fontFamily: 'Roboto-Regular', fontSize: 18),
            ),
            TextSpan(
              text: model.authMode == AuthMode.LOGIN
                  ? 'Sign Up Here'
                  : ' Sign In',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  model.toggleAuthMode();
                  print("button clicked.....\n");
                  print("model.authMode = ${model.authMode}");
                },
              style: TextStyle(
                fontFamily: 'Roboto-Regular',
                fontSize: 18,
                backgroundColor: Colors.black,
                decoration: TextDecoration.underline,
                // color: Color(0xff112BF4),
                color: Colors.blueAccent.shade100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
