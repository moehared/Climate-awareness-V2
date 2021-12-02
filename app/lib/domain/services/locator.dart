import 'package:app/domain/models/questionaire-model/concrete-objects/food.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/goods_services.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/transportation.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/utilities.dart';
import 'package:app/domain/models/questionaire-model/questionaire.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/models/user_post_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/account_service.dart';
import 'package:app/domain/services/database_services/post_service.dart';
import 'package:app/domain/services/network_service/questionaires_endpoint/network_service.dart';
import 'package:app/domain/services/repository/account_firebase_repository.dart';
import 'package:app/domain/services/repository/post_firebase_repository.dart';
import 'package:app/domain/services/repository/repo_interface.dart';
import 'package:app/domain/viewmodel/add-posts-viewmodel/add-post-view-model.dart';
import 'package:app/domain/viewmodel/chat_viewmodel/chat_viewmodel.dart';
import 'package:app/domain/viewmodel/confirm_user_email_viewmodel/confirm_user_email_viewmodel.dart';

import 'package:app/domain/viewmodel/community_viewmodel/community_viewmodel.dart';
import 'package:app/domain/viewmodel/forget-password-viewmodel/forget-password-viewmodel.dart';
import 'package:app/domain/viewmodel/forum-viewmodel.dart/forum-viewmodel.dart';
import 'package:app/domain/viewmodel/location_viewmodel/location_viewmodel.dart';
import 'package:app/domain/viewmodel/profile_viewmodel/profile_viewmodel.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/food-viewmodel.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/goods-services-viewmodel.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/transportation-viewmodel.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/utilities-viewmodel.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/questionaire-viewmodel.dart';
import 'package:app/domain/viewmodel/quick-carbon-viewmodel/quick-carbon-viewmodel.dart';
import 'package:app/domain/viewmodel/tab_viewmodel.dart/tab_viewmodel.dart';
import 'package:app/domain/viewmodel/user-registeration-viewmodel/user_registeration_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get_it/get_it.dart';
import 'package:xml2json/xml2json.dart';

import 'dialog_service/dialog_service.dart';
import 'navigation_service/navigation_service.dart';

// locator design pattern youtube tutorial
// https://youtu.be/DbV5RV2HRUk

// service locator design pattern
final locator = GetIt.instance;
final firestore = FirebaseFirestore.instance;
final firebaseAuth = FirebaseAuth.instance;
final xml2Json = Xml2Json();
void setUpLocatorService() {
  // init singleton object here
  locator.registerLazySingleton<RepositoryInterface<UserModel>>(
      () => AccountFirebaseFireStoreRepo());
  locator.registerLazySingleton<NetworkService>(
      () => NetworkService());
  locator.registerLazySingleton<RepositoryInterface<UserPostModel>>(
      () => PostFirebaseFireStoreRepo());
  locator.registerLazySingleton<AccountFirebaseFireStoreRepo>(
      () => AccountFirebaseFireStoreRepo());
  locator.registerLazySingleton<PostFirebaseFireStoreRepo>(
      () => PostFirebaseFireStoreRepo());
  locator.registerLazySingleton<AccountDatabaseService>(
      () => AccountDatabaseService(locator<AccountFirebaseFireStoreRepo>()));
  locator.registerLazySingleton<AuthService>(() => AuthService(firebaseAuth));
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<DiaglogService>(() => DiaglogService());

  locator.registerLazySingleton<PostDatabaseService>(
      () => PostDatabaseService(locator<PostFirebaseFireStoreRepo>()));
  locator.registerLazySingleton<Questionaire>(() => Questionaire(
        category: [
          Utilities(),
          Transportation(),
          Food(),
          GoodsServices(),
        ],
      ));

  // init factory view here
  locator.registerFactory<CommunityViewModel>(() => CommunityViewModel());
  locator.registerFactory<UserRegisterationViewModel>(
      () => UserRegisterationViewModel());
  locator.registerFactory<ConfirmUserEmailViewModel>(
      () => ConfirmUserEmailViewModel());

  locator.registerFactory<TabViewModel>(() => TabViewModel());
  locator.registerFactory<AddPostViewModel>(() => AddPostViewModel());
  locator.registerFactory<ChatViewModel>(() => ChatViewModel());
  locator.registerFactory<LocationViewModel>(() => LocationViewModel());
  locator.registerFactory<ProfileViewModel>(() => ProfileViewModel());
  locator.registerFactory<QuestionaireViewModel>(() => QuestionaireViewModel());
  locator.registerFactory<UtilitiesViewModel>(() => UtilitiesViewModel());
  locator.registerFactory<FoodViewModel>(() => FoodViewModel());
  locator.registerFactory<TransportationViewModel>(
      () => TransportationViewModel());
  locator
      .registerFactory<GoodsServicesViewModel>(() => GoodsServicesViewModel());
  locator.registerFactory<ForgetPassWordViewModel>(
      () => ForgetPassWordViewModel());
  locator.registerFactory<QuickCarbonViewModel>(() => QuickCarbonViewModel());
  locator.registerFactory<ForumViewModel>(() => ForumViewModel());
}
