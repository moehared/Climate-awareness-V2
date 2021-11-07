import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';

class ProfileViewModel extends BaseViewModel {
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
  }
}