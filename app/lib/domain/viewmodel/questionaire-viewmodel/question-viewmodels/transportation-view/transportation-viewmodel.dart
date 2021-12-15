import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/transportation-view/transportation-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/focus_manager.dart';

class TransportationViewModel extends BaseViewModel {
  final _vehicleTextEditController = TextEditingController();
  final _publicTextEditController = TextEditingController();
  final _airTextEditController = TextEditingController();
  final _publicFocusNode = FocusNode();
  final _airFocusNode = FocusNode();
  final _publicTransitList = publicTransitList;
  final _airTravelList = airTravelList;

  String? busValue;
  get vehicleController => _vehicleTextEditController;

  var _isSimple = true;
  FocusNode get publicFocusNode => _publicFocusNode;

  bool get showSimpleUI => _isSimple;
  List<AirTravelModel> get airTravelAdvanceList => _airTravelList;
  List<PublicTransitModel> get publicTransitAdvanceList => _publicTransitList;
  get publicController => _publicTextEditController;

  get airTravelController => _airTextEditController;

  get airTravelFocusNode => _airFocusNode;

  void onAdvance() {
    showAdvanceUi();
  }

  void onSimple() {
    showAdvanceUi();
  }

  void showAdvanceUi() {
    _isSimple = !_isSimple;
    notifyListeners();
  }
}
