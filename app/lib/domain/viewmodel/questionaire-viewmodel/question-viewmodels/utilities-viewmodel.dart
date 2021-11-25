import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/questionaire-viewmodel.dart';
import 'package:flutter/material.dart';

class UtilitiesViewModel extends BaseViewModel {
  var _sliderValue = 0.0;
  final _controller = TextEditingController();
  TextEditingController get controller => _controller;
  final _questionaireViewModel = locator<QuestionaireViewModel>();
  double get sliderValue => _sliderValue;

  void onSliderChange(double value) {
    _sliderValue = value;
    notifyListeners();
  }
}
