import 'package:app/common/enums/view_state.dart';
import 'package:app/common/styles/textfield-form.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/forget-password-viewmodel/forget-password-viewmodel.dart';
import 'package:app/ui/widgets/button-widget/login-sign-button.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:app/ui/widgets/image-widgets/logo_image.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  static const routeName = '/ForgetPasswordView';
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<ForgetPassWordViewModel>(
      builder: (ctx, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Forget Password'),
        ),
        body: BackgroundImage(
          backgroundImage: 'images/space2.png',
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                child: Text(
                  'Please enter your email to receive verifaction email',
                  style: kTextTitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: model.controller,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: kTextFieldform.copyWith(
                    hintText: 'enter your email',
                  ),
                ),
              ),
              LoginOrSignUpButton(
                title: 'Reset password',
                isBusy: model.viewState == ViewState.BUSY,
                onPress: model.resetPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
