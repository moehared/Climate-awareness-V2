import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/ui/views/confirm-user-email-view/confirm_user_email.dart';
import 'package:app/ui/views/home_view.dart';
import 'package:app/ui/views/user-registeration-view/user_registeration_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthServiceWrapper extends StatelessWidget {
  static const routeName = '/AuthServiceWrapper';
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<AuthService>(context);
    final user = locator<AuthService>();

    if (user.currentUser.isPresent() &&
        !(user.currentUser.get()!.emailVerified)) {
      return ConfirmEmailView();
    } else if (user.currentUser.isPresent() &&
        user.currentUser.get()!.emailVerified) {
      return HomeView();
    } else {
      return UserRegisterationFormView();
    }
  }
}
