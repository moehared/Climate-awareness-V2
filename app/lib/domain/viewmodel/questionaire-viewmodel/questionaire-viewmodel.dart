import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/viewmodel/quick-carbon-viewmodel/quick-carbon-viewmodel.dart';
import 'package:app/ui/views/questionaire-view/question-views/food-view.dart';
import 'package:app/ui/views/questionaire-view/question-views/goods-services-view.dart';
import 'package:app/ui/views/questionaire-view/question-views/transportation-view.dart';
import 'package:app/ui/views/questionaire-view/question-views/utilities-view.dart';
import 'package:flutter/material.dart';

class QuestionaireViewModel extends BaseViewModel {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<String, dynamic> tipData = {};
  static final _pageController = PageController();
  static int _selectedPage = 0;

  static final List<Widget> _pages = [
    UtilitiesView(
      next: nextQuestionScreen,
      prev: previousQuestionScreen,
    ),
    TransportationView(
      next: nextQuestionScreen,
      prev: previousQuestionScreen,
    ),
    FoodView(
      next: nextQuestionScreen,
      prev: previousQuestionScreen,
    ),
    GoodsServicesView(
      next: nextQuestionScreen,
      prev: previousQuestionScreen,
    ),
  ];

  double? _stepAmount, beginWidth, endWidth;

// all methods here

  void setProgressAnim(int curPageIndex) {
    _stepAmount = curPageIndex + 1;
    beginWidth = curPageIndex == 0 ? 1.0 : curPageIndex.toDouble();
    endWidth = _stepAmount! * curPageIndex;
    notifyListeners();
  }

  static void previousQuestionScreen() {
    if (_selectedPage > 0) {
      _selectedPage--;
      _pageController.animateToPage(_selectedPage,
          duration: Duration(microseconds: 250), curve: Curves.bounceInOut);
    }
  }

  static void nextQuestionScreen() {
    if (_selectedPage < _pages.length - 1) {
      _selectedPage++;
      _pageController.animateToPage(
        _selectedPage,
        duration: Duration(microseconds: 250),
        curve: Curves.bounceInOut,
      );
    }
  }

// save qeustion and re-direct user to profile page
  void doneQuestions() async {}

  // all setters

  set setSelectedPageIndex(int pageIndex) {
    _selectedPage = pageIndex;
    print('update page to $_selectedPage');
    notifyListeners();
  }

  // all getters

  GlobalKey<ScaffoldState> get scaffold => _scaffoldKey;
  List<Widget> get pages => _pages;
  int get selectedPage => _selectedPage;
  int get totalPages => _pages.length;
  double get growthStep => _stepAmount ?? 1.0;
  PageController get pageController => _pageController;
}
