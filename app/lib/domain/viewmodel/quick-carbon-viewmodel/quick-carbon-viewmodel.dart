import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/views/questionaire-view/questionaire-view.dart';
import 'package:flutter/material.dart';

class QuickCarbonViewModel extends BaseViewModel {
  final _textController = TextEditingController();
  final _textFocusNode = FocusNode();
  final _navService = locator<NavigationService>();

  TextEditingController get textController => _textController;
  FocusNode get textFocusNode => _textFocusNode;

  void quickCarbonEstimate() {}

  void refineEstimate() {
    _navService.navigateTo(QuestionaireView.routeName);
  }

  void initState() {
    _textFocusNode.addListener(() {
      print('city text has focus ${_textFocusNode.hasFocus} ');
      notifyListeners();
    });
    _textFocusNode.removeListener(() {
      dispose();
    });
  }

  void dispose() {
    _textFocusNode.dispose();
    _textController.dispose();
  }
}
