import 'package:app/common/constant.dart';
import 'package:app/domain/models/questionaire-model/category.dart' as cat;
import 'package:app/domain/models/questionaire-model/concrete-objects/food.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/goods_services.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/transportation.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/utilities.dart';
import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/database_services/account_service.dart';
import 'package:app/domain/services/local_db/share_pref/share_pref.dart';

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

class ProfileViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _userAccountDb = locator<AccountDatabaseService>();
  // final _questionaireBox = locator<Boxes<QuestionaireResult>>();
  UserModel? user;
  // all getters
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

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

  // dynamic? getTipDataObj(int index) {
  //   if (questionaireMap.result.category == null) return;
  //   switch (index) {
  //     case 0:
  //       return questionaireMap.result.category!.values.elementAt(0)
  //           as Utilities;
  //     case 1:
  //       return questionaireMap.result.category!.values.elementAt(1)
  //           as Transportation;
  //     case 2:
  //       return questionaireMap.result.category!.values.elementAt(2) as Food;
  //     case 3:
  //       return questionaireMap.result.category!.values.elementAt(3)
  //           as GoodsServices;
  //     default:
  //       return null;
  //   }
  // }

//TODO: save user carbon footprint locally. so we avoid making too many calls to our DB
  void initState() async {
    final Map<String, cat.Category> questionaire = {};
    // user = await _userAccountDb
    //     .fetchUserModel(_authService.currentUser.get()!.uid);
    // notifyListeners();
    // debugPrint('user is updated in profile viewmodel ${user?.c02Score}');
    final res = await SharePref.getData(QUESTIONAIRE_RESULT_BOX);

    debugPrint('result profile: $res\n');
    debugPrint('result2: ${res.runtimeType}');
    print('res == $res');
    final category = res['category'];
    final utilities = Utilities.fromJson(category['Q1']);
    final transportation = Transportation.fromJson(category['Q2']);
    final food = Food.fromJson(category['Q3']);
    final goodsService = GoodsServices.fromJson(category['Q4']);

    print('utilities == $utilities');
    print('transporation == $transportation');
    print('food: $food');
    print('goodsService: $goodsService');
    questionaire.putIfAbsent('Q1', () => utilities);
    questionaire.putIfAbsent('Q2', () => transportation);
    questionaire.putIfAbsent('Q3', () => food);
    questionaire.putIfAbsent('Q4', () => goodsService);
    // ignore: unnecessary_statements
    questionaireMap.setCategoryMap = questionaire;

    final result = res['result'];
    final resultObj = QuestionaireResult.fromJson(result);
    questionaireMap.result = resultObj;
    notifyListeners();
    print('questionaire result == ${questionaireMap.categoryMap}');
  }

  void navigateToQuestionaireView() {
    print('go to question view');
    _navService.navigateTo(QuickCarbonView.routeName);
  }

  void showChartDetailsView() {
    _navService.navigateTo(ChartDetailsView.routeName);
  }

  void navigateToViewAll() {
    _navService.navigateTo(PersonalizedViewAll.PERSONALIZED_VIEW_ALL);
  }
}
