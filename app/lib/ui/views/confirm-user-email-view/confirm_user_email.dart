import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/confirm_user_email_viewmodel/confirm_user_email_viewmodel.dart';
import 'package:app/ui/views/user-registeration-view/user_registeration_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ConfirmEmailView extends StatelessWidget {
  static const routeName = '/ConfirmEmailView';
  const ConfirmEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<ConfirmUserEmailViewModel>(
        builder: (ctx, model, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('verification '),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'An email has just been sent to ${model.email}, Click the link provided to complete registration. To re-send verifications email, ',
                          style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Click here \n\n\n',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => model.sendEmailVerification(),
                          style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 18,
                              color: Color(0xff112BF4)),
                        ),
                        TextSpan(
                          text: 'If you are already verified, please ',
                          style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Sign in',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              model.signOut();
                              model.navigateToLoginView();
                            },
                          style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontSize: 18,
                              color: Color(0xff112BF4)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
