import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/ui/views/confirm-user-email-view/confirm_user_email.dart';
import 'package:app/ui/views/tab-views/tab-views.dart';
import 'package:app/ui/views/user-registeration-view/user_registeration_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServiceWrapper extends StatelessWidget {
  static const routeName = '/AuthServiceWrapper';

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<AuthService>(context);
    final _authService = locator<AuthService>();

    if (_authService.currentUser.isPresent() &&
        !(_authService.currentUser.get()!.emailVerified)) {
      return ConfirmEmailView();
    } else if (_authService.currentUser.isPresent() &&
        _authService.currentUser.get()!.emailVerified) {
      return TabViews();
    } else {
      return UserRegisterationFormView();
    }
  }
}
