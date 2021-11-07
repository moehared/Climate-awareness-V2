import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/views/pages-views/pages_views.dart';
import 'package:flutter/material.dart';

class TabViewModel extends BaseViewModel {
  List<Map<String, Widget>> _views = [];

  int _selectedPageIndex = 0;

  void init() {
    _views = views;
  }

  List<Map<String, Widget>> get pages => _views;
  int get selectedPageIndex => _selectedPageIndex;

  void selectPage(int index) {
    _selectedPageIndex = index;
    notifyListeners();
  }
}
