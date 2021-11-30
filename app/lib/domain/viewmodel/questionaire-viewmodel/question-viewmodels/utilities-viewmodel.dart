import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:flutter/material.dart';

class UtilitiesViewModel extends BaseViewModel {
  var _waterValue = 0.0;
  final _electrictyController = TextEditingController();
  final _heatingController = TextEditingController();
  final _naturalGasController = TextEditingController();
  final _livingSpaceController = TextEditingController();
  final _naturalGasFocusNode = FocusNode();
  final _heatingFocusNode = FocusNode();
  final _spaceLivingFocusNode = FocusNode();
  TextEditingController get electrictyController => this._electrictyController;
  TextEditingController get heatingController => this._heatingController;
  TextEditingController get naturalGasController => this._naturalGasController;
  TextEditingController get livingSpaceController =>
      this._livingSpaceController;
  FocusNode get naturalGasFocusNode => this._naturalGasFocusNode;
  FocusNode get heatingFocusNode => this._heatingFocusNode;
  FocusNode get livingSpaceFocusNode => this._spaceLivingFocusNode;
  double get waterSliderValue => _waterValue;

  void onWaterValueChange(double value) {
    _waterValue = value;
    notifyListeners();
  }

  String waterValueLabel(int value) {
    switch (value) {
      case 0:
        return 'Average: 242 liters/ day';
      case 1:
        return '1-person household: 148 liters/day';
      case 2:
        return '2-person household: 242 liters/day';
      case 3:
        return '3-person household: 261 liters/day';
      case 4:
        return '4-person household: 299 literes/day';
      case 5:
        return '5 or more people household: 337 liters/day';
      default:
        return '';
    }
  }
}
