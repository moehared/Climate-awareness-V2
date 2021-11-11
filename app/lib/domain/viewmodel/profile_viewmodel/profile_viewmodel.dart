import 'dart:io';

import 'package:app/domain/services/authentication_service/auth_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/views/questionaire-view/questionaire-view.dart';
import 'package:app/ui/widgets/user-setting-menu/user_setting_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // all getters
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  // all methods

  void signOut() {
    _authService.signOut();
    notifyListeners();
  }

  void showPopUpMenu(model) {
    showModalBottomSheet(
      context: _scaffoldKey.currentState!.context,
      builder: (ctx) => UserMenuPopUp(
        isEdit: false,
        id: '',
        uuid: '',
        command: model,
      ),
    );
  }

  void navigateToQuestionaireView() {
    print('go to question view');
    _navService.navigateTo(QuestionaireView.routeName);
  }
}
