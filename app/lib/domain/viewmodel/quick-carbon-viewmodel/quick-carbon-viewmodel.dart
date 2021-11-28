import 'package:app/common/constant.dart';
import 'package:app/common/utils/prompt_dialog.dart';
import 'package:app/domain/models/suggestion_place.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/services/navigation_service/navigation_service.dart';
import 'package:app/domain/services/network_service/questionaires_endpoint/network_service.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/views/questionaire-view/questionaire-view.dart';
import 'package:flutter/material.dart';

class QuickCarbonViewModel extends BaseViewModel {
  final _textController = TextEditingController();
  final _textFocusNode = FocusNode();
  final _dialogService = locator<DiaglogService>();
  final _navService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();
  List<SuggestionPlace> _placeList = [];
  TextEditingController get textController => _textController;
  FocusNode get textFocusNode => _textFocusNode;
  List<SuggestionPlace> get placeList => _placeList;

  void quickCarbonEstimate() {}

  void refineEstimate() {
    _navService.navigateTo(QuestionaireView.routeName);
  }

  void initState(ctx) {
    _textFocusNode.removeListener(() => _dispose());
  }

  void _dispose() {
    _textFocusNode.dispose();
    _textController.dispose();
  }

  Future fetchPlaces(city) async {
    try {
      _placeList = await _networkService.fetchPlaces(city);
      notifyListeners();
    } catch (e) {
      if (e.toString().contains('ZERO_RESULTS')) {
        this._textFocusNode.unfocus();
        promptDialog(
          message: "we could not find the city '$city' You have entered",
          dialogService: _dialogService,
          title: 'No city found',
        );

        // return;
      } else {
        promptDialog(
          message: 'Could not Fetch city',
          dialogService: _dialogService,
          title: 'Something went wrong!',
        );
      }
    }
  }

  void onSelectedCity(city) {
    this._textController.text = city;
    this._textFocusNode.unfocus();
    this._placeList = [];
    notifyListeners();
  }

  void showHousePeopleInfo() {
    promptDialog(
      message: HOUSE_HOLD_PEOPLE_INFO,
      dialogService: _dialogService,
      title: HOUSE_HOLD_QUESTION,
    );
  }

  void showHouseHoldIncomeInfo() {
    promptDialog(
      message: HOUSE_HOLD_INCOME_INFO,
      dialogService: _dialogService,
      title: HOUSE_HOLD_INCOME,
    );
  }
}
