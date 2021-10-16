import 'package:app/domain/services/database_service.dart';
import 'package:app/domain/services/repository/firebase_repository.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:app/domain/viewmodel/homeView_model.dart';
import 'package:app/domain/viewmodel/user-registeration-view-model/user_registeration_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

// locator design pattern youtube tutorial
// https://youtu.be/DbV5RV2HRUk

// service locator design pattern
final locator = GetIt.instance;

void setUpLocatorService() {
  // init singleton object here
  locator.registerLazySingleton<RepositoryInterface>(
      () => FirebaseFireStoreRepo(FirebaseFirestore.instance));

  locator.registerLazySingleton<DatabaseService>(
      () => DatabaseService(locator<RepositoryInterface>()));

  // init factory view here
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<UserRegisterationViewModel>(
      () => UserRegisterationViewModel());
}
