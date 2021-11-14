// ignore_for_file: file_names

import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/ui/views/forget-password-view/forget-password-view.dart';
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
        child: TextButton(
          onPressed: () {
            locator<NavigationService>()
                .navigateTo(ForgetPasswordView.routeName);
          },
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
      ),
    );
  }
}
