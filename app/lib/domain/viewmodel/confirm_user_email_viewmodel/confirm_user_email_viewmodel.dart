import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/views/user-registeration-view/user_registeration_view.dart';

class ConfirmUserEmailViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();
  final _email = locator<AuthService>().currentUser.get()?.email ?? '';
  String get email => _email;
  void signOut() {
    _authService.signOut();
    notifyListeners();
  }

  void sendEmailVerification() {
    if (_authService.currentUser.isPresent()) {
      _authService.currentUser.get()!.sendEmailVerification();
      print('........');
    }
  }

  void navigateToLoginView() {
    _navService.navigateTo(UserRegisterationFormView.routeName);
  }
}
