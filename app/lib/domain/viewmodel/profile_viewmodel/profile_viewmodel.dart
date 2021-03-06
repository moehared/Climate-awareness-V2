import 'dart:io';

import 'package:app/common/constant.dart';
import 'package:app/common/utils/optional.dart';
import 'package:app/domain/models/questionaire-model/category.dart' as cat;
import 'package:app/domain/models/questionaire-model/concrete-objects/food.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/goods_services.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/transportation.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/utilities.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/account_service.dart';
import 'package:app/domain/services/local_db/share_pref/share_pref.dart';
import 'package:app/domain/models/Achievement-model.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/main.dart';
import 'package:app/ui/views/profile-view/chart-details-view.dart';
import 'package:app/ui/views/profile-view/personalized-tips-view/personalized-view-all.dart';

import 'package:app/ui/views/questionaire-view/question-views/quick-carbon-calculation-view.dart';
import 'package:app/domain/models/questionaire-model/questionaire-result.dart';
import 'package:app/ui/views/user-registeration-view/user_registeration_view.dart';
import 'package:app/ui/widgets/user-setting-menu/user_setting_menu.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileViewModel extends BaseViewModel {
  static const IMAGE_KEY = 'IMAGE_KEY';
  static const USER_INFO = 'USER_INFO ';
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _userAccountDb = locator<AccountDatabaseService>();
  final _auth = locator<AuthService>();

  UserModel? _userModel;
  File? _image;
  final imagePicker = ImagePicker();
  // final _questionaireBox = locator<Boxes<QuestionaireResult>>();
  // all getters
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  File? get image => _image;
  UserModel? get user => _userModel;

  // all methods

  void signOut() {
    _authService.signOut();
    notifyListeners();
    _navService.navigateAndReplce(UserRegisterationFormView.routeName);
  }

  void showPopUpMenu(model) {
    showModalBottomSheet(
      context: _scaffoldKey.currentState!.context,
      builder: (ctx) => ProfileMenuPopUp(
        command: model,
      ),
    );
  }

  void initState() async {
    await fetchUserInfo();
    await fetchQuestionaireResult();
    loadImage();
  }

  Future<void> fetchQuestionaireResult() async {
    final Map<String, cat.Category> questionaire = {};
    final res = await SharePref.getData(QUESTIONAIRE_RESULT_BOX);
    final achievmentData = await SharePref.getData(ECO_FRIENDLY_ACHIEVEMENT);
    if (res == null) return;
    debugPrint('res == $res');
    fetchAchievment(achievmentData);
    final category = res['category'];
    final utilities = Utilities.fromJson(category['Q1']);
    final transportation = Transportation.fromJson(category['Q2']);
    final food = Food.fromJson(category['Q3']);
    final goodsService = GoodsServices.fromJson(category['Q4']);
    questionaire.putIfAbsent('Q1', () => utilities);
    questionaire.putIfAbsent('Q2', () => transportation);
    questionaire.putIfAbsent('Q3', () => food);
    questionaire.putIfAbsent('Q4', () => goodsService);
    questionaireMap.setCategoryMap = questionaire;
    final result = res['result'];
    final resultObj = QuestionaireResult.fromJson(result);
    questionaireMap.result = resultObj;
    notifyListeners();
  }

  void fetchAchievment(achievmentData) {
    if (achievmentData == null) return;
    debugPrint('achievment map resul: $achievmentData\n');
    final achievment = Achievement.fromMap(achievmentData);
    debugPrint('achievment  resul: $achievment\n');
    achievmentMap.putIfAbsent(ECO_FRIENDLY_ACHIEVEMENT, () => achievment);
    debugPrint('achievmentMap === $achievmentMap');
  }

  Future<void> fetchUserInfo() async {
    final userInfo = await SharePref.getData(USER_INFO) ?? null;
    debugPrint('User info: $userInfo');
    if (_auth.currentUser.isPresent() && userInfo == null) {
      debugPrint('logged in user: ${_auth.currentUser.get()!}');
      _userModel =
          await _userAccountDb.fetchUserModel(_auth.currentUser.get()!.uid);
    } else {
      _userModel = UserModel.fromMap(userInfo);
    }
    notifyListeners();
  }

  void navigateToQuestionaireView() {
    _navService.navigateTo(QuickCarbonView.routeName);
  }

  void showChartDetailsView() {
    _navService.navigateTo(ChartDetailsView.routeName);
  }

  void navigateToViewAll() {
    _navService.navigateTo(PersonalizedViewAll.PERSONALIZED_VIEW_ALL);
  }

  void loadImage() async {
    if (!_auth.currentUser.isPresent()) return;
    final uuid = _auth.currentUser.get()!.uid;
    final imageString = await SharePref.getData(IMAGE_KEY, uuid) as String;
    print('image string: $imageString');
    if (imageString.isNotEmpty) {
      _image = File(imageString);
      notifyListeners();
    }
    // SharePref.delete(key);
  }

  void uploadImageOrOpenCamera([bool isUpload = false]) async {
    if (!_auth.currentUser.isPresent()) return;
    final uuid = _auth.currentUser.get()!.uid;
    final key = '$IMAGE_KEY/$uuid';

    final pickedFile = await imagePicker.pickImage(
        source: isUpload ? ImageSource.gallery : ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
      debugPrint('saved at key: $uuid');
      SharePref.saveQuestionaire(uuid, _image!.path);
    }
  }
}
