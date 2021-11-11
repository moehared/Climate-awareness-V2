import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/views/questionaire-view/question-views/food-view.dart';
import 'package:app/ui/views/questionaire-view/question-views/goods-services-view.dart';
import 'package:app/ui/views/questionaire-view/question-views/transportation-view.dart';
import 'package:app/ui/views/questionaire-view/question-views/utilities-view.dart';
import 'package:flutter/material.dart';

class QuestionaireViewModel extends BaseViewModel {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<String, dynamic> tipData = {};
  final _pageController = PageController();

  int _selectedPage = 0;

  final List<Widget> _pages = [
    UtilitiesView(),
    TransportationView(),
    FoodView(),
    GoodsServicesView(),
  ];

  double? stepAmount, beginWidth, endWidth;

// all methods here

  void setProgressAnim(int curPageIndex) {
    stepAmount = curPageIndex + 1;
    beginWidth = curPageIndex == 0 ? 1.0 : curPageIndex.toDouble();
    endWidth = stepAmount! * curPageIndex;
    notifyListeners();
  }

  void previousQuestionScreen() {
    if (_selectedPage > 0) {
      _selectedPage--;
      _pageController.animateToPage(_selectedPage,
          duration: Duration(microseconds: 250), curve: Curves.bounceInOut);
    }
  }

  void nextQuestionScreen() {
    if (_selectedPage < _pages.length - 1) {
      _selectedPage++;
      _pageController.animateToPage(_selectedPage,
          duration: Duration(microseconds: 250), curve: Curves.bounceInOut);
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
  int get growthStep => growthStep.toInt();
  PageController get pageController => _pageController;
}
