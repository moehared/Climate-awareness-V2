import 'package:app/common/enums/view_state.dart';
import 'package:app/domain/viewmodel/user-registeration-viewmodel/user_registeration_viewmodel.dart';
import 'package:flutter/material.dart';

// ignore_for_file: file_names
class LoginOrSignUpButton extends StatelessWidget {
  const LoginOrSignUpButton({
    Key? key,
    required this.model,
  }) : super(key: key);
  final UserRegisterationViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.secondary,
          tapTargetSize: MaterialTapTargetSize.padded,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        onPressed: () => model.submit(context),
        child: model.viewState == ViewState.BUSY
            ? CircularProgressIndicator()
            : Text(
          model.authMode == AuthMode.LOGIN ? "Sign In" : "Sign Up",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Roboto-Regular",
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
