import 'dart:io';

import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/authentication_service/auth_service_wrapper.dart';
import 'package:app/domain/services/database_services/account_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/views/profile-view/chart-details-view.dart';
import 'package:app/ui/views/questionaire-view/question-views/quick-carbon-calculation-view.dart';
import 'package:app/ui/views/questionaire-view/questionaire-view.dart';
import 'package:app/ui/views/user-registeration-view/user_registeration_view.dart';
import 'package:app/ui/widgets/user-setting-menu/user_setting_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _userAccountDb = locator<AccountDatabaseService>();
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

//TODO: save user carbon footprint locally. so we avoid making too many calls to our DB
  void initState() async {
    // user = await _userAccountDb
    //     .fetchUserModel(_authService.currentUser.get()!.uid);
    // notifyListeners();
    // debugPrint('user is updated in profile viewmodel ${user?.c02Score}');
  }

  void navigateToQuestionaireView() {
    print('go to question view');
    _navService.navigateTo(QuickCarbonView.routeName);
  }

  void showChartDetailsView() {
    _navService.navigateTo(ChartDetailsView.routeName);
  }
}
