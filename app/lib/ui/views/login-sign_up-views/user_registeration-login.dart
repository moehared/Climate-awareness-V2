// ignore_for_file: file_names

import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/user-registeration-view-model/user_registeration_viewmodel.dart';
import 'package:app/ui/widgets/button-widget/create-account-button.dart';
import 'package:app/ui/widgets/button-widget/forget-password-button.dart';
import 'package:app/ui/widgets/button-widget/login-sign-button.dart';
import 'package:app/ui/widgets/form/create-form.dart';
import 'package:app/ui/widgets/image-widgets/background_image.dart';
import 'package:app/ui/widgets/image-widgets/logo_image.dart';
import 'package:app/ui/widgets/login-with-third-party-app/login-with-third-party-app.dart';
import 'package:app/ui/widgets/text-widgets/user_registeration_text_title.dart';
import 'package:flutter/material.dart';

class UserRegisterationFormView extends StatefulWidget {
  const UserRegisterationFormView({Key? key}) : super(key: key);

  @override
  _UserRegisterationFormViewState createState() =>
      _UserRegisterationFormViewState();
}

class _UserRegisterationFormViewState extends State<UserRegisterationFormView> {
  @override
  Widget build(BuildContext context) {
    return BuildViewModel<UserRegisterationViewModel>(
      builder: (ctx, model, child) => Scaffold(
        body: BackgroundImage(
          backgroundImage: "images/space.png",
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UserRegisterationTitleText(
                    longTextTitle: "Create Account",
                  ),
                  const LogoImageAvatar(
                    imageAsset: "images/global.png",
                  ),
                  CreateRegisterationForm(model: model),
                  const SizedBox(height: 10),
                  const LoginOrSignUpButton(),
                  const SizedBox(height: 10),
                  const ForgetPasswordButton(),
                  const SizedBox(height: 40),
                  const LoginWithThirdPartyApplication(),
                  const SizedBox(height: 40),
                  const CreateAccountButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
