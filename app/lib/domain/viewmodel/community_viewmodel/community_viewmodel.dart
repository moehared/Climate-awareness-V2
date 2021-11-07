// ignore_for_file: file_names

import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/ui/views/user-registeration-view/user_registeration_view.dart';
import 'package:provider/provider.dart';

import '../base_viewmodel/baseview_model.dart';

class CommunityViewModel extends BaseViewModel {
  int _counter = 0;
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  get counter => _counter;

  void signOut() {
    _authService.signOut();
    notifyListeners();
    _navService.navigateAndReplce(UserRegisterationFormView.routeName);
    notifyListeners();
  }
}
