import 'package:app/common/constant.dart';
import 'package:app/common/utils/prompt_dialog.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
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
  final _dialogService = locator<DiaglogService>();
  final _publicTransitList = publicTransitList;
  final _airTravelList = airTravelList;
  var _vehicleCount = 0;
  var _mpgValues = <double>[];
  var _fuelTypeValues = <String>[];
  var _publicUnitDropdownValues = <String>[];
  var _unitTypeValues = <String>[];
  var _isValid = true;
  var _publicUnitValue = 'KM';
  var _publicAdvanceUnitValue = List.filled(publicTransitList.length, 'Km');
  var _publicTransitHintText = '600 km/year';

  String? busValue;

  var _airTravelHintText = '5000 km/year';

  var _airTravelUnitDropdownValue = 'Km';
  get vehicleController => _vehicleTextEditController;

  var _isSimple = true;
  FocusNode get publicFocusNode => _publicFocusNode;

  bool get showSimpleUI => _isSimple;
  List<AirTravelModel> get airTravelAdvanceList => _airTravelList;
  List<PublicTransitModel> get publicTransitAdvanceList => _publicTransitList;
  get publicController => _publicTextEditController;

  get airTravelController => _airTextEditController;

  get airTravelFocusNode => _airFocusNode;

  int get vehicleCount => _vehicleCount;

  List<double> get mpgValues => _mpgValues;

  List<String> get fuelTypeValues => _fuelTypeValues;
  List<String> get unitTypeValues => _unitTypeValues;

  String get publicUnitValue => _publicUnitValue;
  List<String> get publicAdvanceUnitValue => _publicAdvanceUnitValue;

  String get publicTransitHintText => _publicTransitHintText;

  String get airTravelUnitDropdownValue => _airTravelUnitDropdownValue;

  String get airTravelHintText => _airTravelHintText;

  void onAdvance() {
    showAdvanceUi();
  }

  void onSimple() {
    showAdvanceUi();
  }

  void addMPGValue([double intitalValue = 22.0]) {
    _mpgValues.add(intitalValue);
  }

  void addUnitTypeValue([String unit = 'Km']) {
    _unitTypeValues.add(unit);
  }

  void addFuelTypeValue([String fuel = 'Gasoline']) {
    _fuelTypeValues.add(fuel);
  }

  void showAdvanceUi() {
    _isSimple = !_isSimple;
    notifyListeners();
  }

  void showVehicleUI() {
    addMPGValue();
    addFuelTypeValue();
    addUnitTypeValue();
    _vehicleCount++;

    notifyListeners();
  }

  void removeVehicleUI() {
    if (_vehicleCount > 0) {
      _mpgValues.removeLast();
      _vehicleCount--;
      notifyListeners();
    }
  }

  void updateMPGValue(double val, int curr) {
    _mpgValues[curr] = val;
    notifyListeners();
  }

  updateFuelDropdown(String? type, int i) {
    if (type == null) {
      _isValid = false;
      return;
    }

    _fuelTypeValues[i] = type;
    notifyListeners();
  }

  void updateUnitDropdown(String? item, int i) {
    if (item == null) {
      _isValid = false;
      return;
    }
    _unitTypeValues[i] = item;
    notifyListeners();
  }

  void updatePublicUnitDropdownValue(String? unit) {
    final isMile = unit == 'Mi';
    if (!_validateDropdownValue(unit)) {
      _isValid = true;
      return;
    }
    _publicTransitHintText = isMile ? '368 Mi/year' : '600 km/year';
    _publicUnitValue = unit!;
    notifyListeners();
  }

  bool _validateDropdownValue(String? unit) {
    return unit != null;
  }

  void updatePublicAdvanceDropdownValues(String? unit, int index) {
    if (!_validateDropdownValue(unit)) {
      _isValid = true;
      return;
    }
    final isMile = unit == 'Mi';
    if (isMile) {
      _publicTransitList[index].hinText = _convertUnit(index);
    }
    _publicAdvanceUnitValue[index] = unit!;
    notifyListeners();
  }

  String _convertUnit(int index) {
    switch (index) {
      case 0:
        return '147 Mi/year';
      case 1:
        return '110 Mi/year';
      case 2:
        return '74 Mi/year';
      case 3:
        return '37 Mi/year';

      default:
        return '';
    }
  }

  updateAirTravelUnitDropdownValue(String? unit) {
    if (!_validateDropdownValue(unit)) {
      _isValid = true;
      return;
    }
    final isMile = unit == 'Mi';

    _airTravelHintText = isMile ? '3,300 mile/year' : '5000 km/year';

    _airTravelUnitDropdownValue = unit!;
    notifyListeners();
  }

  void showPublicTransitHelpInfo() {
    promptDialog(
      message: PUBLIC_TRANSIT_HELP_TEXT,
      dialogService: _dialogService,
      title: 'Public Transit',
    );
  }

  void showAirTransitHelpInfo() {
    promptDialog(
      title: 'Air Travel',
      message: AIR_TRANSIT_HELP_TEXT,
      dialogService: _dialogService,
    );
  }

  updateAirAdvanceDropdown(String? val, int index) {
    if (val == null) {
      _isValid = false;
      return;
    }
    this._airTravelList[index].dropdownValue = 'Flight/$val';
    notifyListeners();
  }
}
