import 'package:app/domain/viewmodel/homeView_model.dart';
import 'package:app/domain/viewmodel/user-registeration-view-model/user_registeration_viewmodel.dart';
import 'package:get_it/get_it.dart';

// service locator design pattern
final locator = GetIt.instance;

void setUpLocatorService() {
  // init singleton object here

  // init factory view here
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<UserRegisterationViewModel>(
      () => UserRegisterationViewModel());
}
