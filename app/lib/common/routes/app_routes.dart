import 'package:app/domain/services/authentication_service/auth_service_wrapper.dart';
import 'package:app/ui/views/confirm-user-email-view/confirm_user_email.dart';
import 'package:app/ui/views/home_view.dart';
import 'package:app/ui/views/user-registeration-view/user_registeration_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case UserRegisterationFormView.routeName:
        return MaterialPageRoute(builder: (_) => UserRegisterationFormView());
      case ConfirmEmailView.routeName:
        return MaterialPageRoute(builder: (_) => ConfirmEmailView());
      case HomeView.routeName:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return MaterialPageRoute(builder: (_) => AuthServiceWrapper());
    }
  }
}
