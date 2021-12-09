import 'package:app/domain/models/user_model.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/views/pages-views/pages_views.dart';
import 'package:flutter/material.dart';

class TabViewModel extends BaseViewModel {
  List<Map<String, Widget>> _views = [];
  static List<UserModel> _userModelList = [];
  int _selectedPageIndex = 0;

  void init(int directedIndexPage) {
    if (directedIndexPage > 0) {
      _selectedPageIndex = directedIndexPage;
    }
    _views = views;
  }

  List<Map<String, Widget>> get pages => _views;
  int get selectedPageIndex => _selectedPageIndex;
  static List<UserModel> get userModel => _userModelList;
  void selectPage(int index) {
    _selectedPageIndex = index;
    notifyListeners();
  }

  //TODO: read user info once tab view is loaded so we have access to all users info
  // static Future<UserModel> loadAllUserInfo() async {
    
  // }
}
