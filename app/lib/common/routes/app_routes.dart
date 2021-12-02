import 'package:app/domain/services/authentication_service/auth_service_wrapper.dart';
import 'package:app/domain/viewmodel/chat_viewmodel/chat_viewmodel.dart';
import 'package:app/ui/views/add-post-view/add-posts-view.dart';
import 'package:app/ui/views/confirm-user-email-view/confirm_user_email.dart';

import 'package:app/ui/views/forget-password-view/forget-password-view.dart';
import 'package:app/ui/views/forum-view/forum-view.dart';
import 'package:app/ui/views/questionaire-view/question-views/quick-carbon-calculation-view.dart';

import 'package:app/ui/views/questionaire-view/questionaire-view.dart';
import 'package:app/ui/views/user-registeration-view/user_registeration_view.dart';
import 'package:app/ui/widgets/youtube-player-widget/youtube-player.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case UserRegisterationFormView.routeName:
        return MaterialPageRoute(builder: (_) => UserRegisterationFormView());
      case ConfirmEmailView.routeName:
        return MaterialPageRoute(builder: (_) => ConfirmEmailView());
      case ForumView.routeName:
        return MaterialPageRoute(builder: (_) => ForumView());
      case QuestionaireView.routeName:
        return MaterialPageRoute(builder: (_) => QuestionaireView());
             case QuickCarbonView.routeName:
        return MaterialPageRoute(builder: (_) => QuickCarbonView());
      case ForgetPasswordView.routeName:
        return MaterialPageRoute(builder: (_) => ForgetPasswordView());
            case AddPostView.routeName:
        return MaterialPageRoute(builder: (_) => AddPostView());
            case PlayYoutubeVideo.routeName:
        return MaterialPageRoute(builder: (_) => PlayYoutubeVideo(youtubeData: settings.arguments as YoutubeData,));
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
