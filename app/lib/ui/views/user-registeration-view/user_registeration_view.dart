// ignore_for_file: file_names

import 'package:app/common/enums/view_state.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/user-registeration-viewmodel/user_registeration_viewmodel.dart';
import 'package:app/ui/widgets/button-widget/create-account-button.dart';
import 'package:app/ui/widgets/button-widget/forget-password-button.dart';
import 'package:app/ui/widgets/button-widget/login-sign-button.dart';
import 'package:app/ui/widgets/form/create-form.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:app/ui/widgets/image-widgets/logo_image.dart';
import 'package:app/ui/widgets/login-with-third-party-app/login-with-third-party-app.dart';
import 'package:app/ui/widgets/text-widgets/user_registeration_text_title.dart';
import 'package:flutter/material.dart';

class UserRegisterationFormView extends StatelessWidget {
  static const routeName = '/UserRegisterationFormView';
  const UserRegisterationFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildViewModel<UserRegisterationViewModel>(
      builder: (ctx, model, child) => Scaffold(
        body: BackgroundImage(
          backgroundImage: "images/space2.png",
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserRegisterationTitleText(
                    smallText: false,
                    longTextTitle: model.authMode == AuthMode.LOGIN
                        ? "Welcome Back"
                        : "Create Account",
                  ),
                  const LogoImageAvatar(
                    imageAsset: "images/global.png",
                  ),
                  CreateRegisterationForm(
                    model: model,
                  ),
                  const SizedBox(height: 10),
                  LoginOrSignUpButton(
                    model: model,
                  ),
                  const SizedBox(height: 10),
                  if (model.authMode == AuthMode.LOGIN)
                    const ForgetPasswordButton(),
                  const SizedBox(height: 10),
                  if (model.authMode == AuthMode.LOGIN)
                    const LoginWithThirdPartyApplication(),
                  if (model.authMode == AuthMode.LOGIN)
                    const SizedBox(height: 40),
                  CreateAccountButton(model: model),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
