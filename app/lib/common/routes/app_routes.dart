import 'package:app/domain/services/authentication_service/auth_service_wrapper.dart';
import 'package:app/domain/viewmodel/chat_viewmodel/chat_viewmodel.dart';
import 'package:app/ui/views/chat-view/chat-view.dart';
import 'package:app/ui/views/confirm-user-email-view/confirm_user_email.dart';
import 'package:app/ui/views/community-view/community_view.dart';
import 'package:app/ui/views/location-view/location-view.dart';
import 'package:app/ui/views/profile-view/profile-view.dart';
import 'package:app/ui/views/user-registeration-view/user_registeration_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case UserRegisterationFormView.routeName:
        return MaterialPageRoute(builder: (_) => UserRegisterationFormView());
      case ConfirmEmailView.routeName:
        return MaterialPageRoute(builder: (_) => ConfirmEmailView());
      // case CommunityView.routeName:
      //   return MaterialPageRoute(builder: (_) => CommunityView());
      //   case ChatView.routeName:
      //   return MaterialPageRoute(builder: (_) => ChatView());
      //   case LocationView.routeName:
      //   return MaterialPageRoute(builder: (_) => LocationView());
      //    case ProfileView.routeName:
      //   return MaterialPageRoute(builder: (_) => ProfileView());
      default:
        return MaterialPageRoute(builder: (_) => AuthServiceWrapper());
    }
  }
}
