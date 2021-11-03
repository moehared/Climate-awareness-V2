import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';

class ConfirmUserEmailViewModel extends BaseViewModel {
  void signOut() {
    locator<AuthService>().signOut();
    notifyListeners();
  }
}
