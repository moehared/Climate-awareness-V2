import 'package:app/common/constant.dart';
import 'package:app/common/utils/input_validator.dart';
import 'package:app/common/utils/prompt_dialog.dart';

import 'package:app/domain/models/questionaire-model/concrete-objects/transportation.dart';

import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/question-viewmodels/transportation-view/transportation-model.dart';

import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../questionaire-viewmodel.dart';

class TransportationViewModel extends BaseViewModel {
  final _vehicleTextEditController = TextEditingController();
  final _publicTextEditController = TextEditingController();
  final _airTextEditController = TextEditingController();
  final _publicFocusNode = FocusNode();
  final _airFocusNode = FocusNode();
  var _vehicleModel = Vehicle(
      totalDrivenPerYear: 0,
      fuelType: "Gasoline",
      unitType: "km",
      mpgValue: ' 22.0 mpg');
  final Map<int, Vehicle> _vehiclesMap = {};
  final _dialogService = locator<DiaglogService>();
  final _publicTransitList = publicTransitList;
  final _airTravelList = airTravelList;
  var _vehicleCount = 0;
  var _mpgValues = <double>[];
  var _vehicleControllers = <TextEditingController>[];
  var _fuelTypeValues = <String>[];
  var _transportationModel = Transportation(
      numberOfVehicle: 0,
      questionID: "Q2",
      bus: '0',
      commuterRail: '0',
      interCityRail: '0',
      numberOfExtendedTravelByAir: '0',
      numberOfLongTravelByAir: '0',
      numberOfMediumTravelByAir: '0',
      numberOfShortTravelByAir: '0',
      transitRail: '0',
      totalPublicTransitPerYear: "0",
      totalAirTravelPerYear: "0",
      vehicle: [],
      busUnit: 'km',
      commuterRailUnit: 'km',
      isSimple: false,
      interCityRailUnit: 'km',
      longTravelByAir: 'Flight/Month',
      extendedTravelByAir: 'Flight/Month',
      mediumTravelByAir: 'Flight/Month',
      shortTravelByAir: 'Flight/Month',
      transitRailUnit: 'km',
      publicTransitUnit: "km",
      airTravelUnit: "km");

  var _unitTypeValues = <String>[];

  var _publicUnitValue = 'km';
  var _publicAdvanceUnitValue = List.filled(publicTransitList.length, 'km');
  var _publicTransitHintText = '600 km/year';
  var _disableDropdownButtons = true;
  String? busValue;

  var _airTravelHintText = '5000 km/year';

  var _airTravelUnitDropdownValue = 'km';
  get vehicleController => _vehicleTextEditController;

  var _isSimple = true;
  FocusNode get publicFocusNode => _publicFocusNode;

  bool get showSimpleUI => _isSimple;
  List<AirTravelModel> get airTravelAdvanceList => _airTravelList;
  List<PublicTransitModel> get publicTransitAdvanceList => _publicTransitList;
  get publicController => _publicTextEditController;

  TextEditingController get airTravelController => _airTextEditController;
  FocusNode get airTravelFocusNode => _airFocusNode;

  int get vehicleCount => _vehicleCount;

  List<double> get mpgValues => _mpgValues;

  List<String> get fuelTypeValues => _fuelTypeValues;
  List<String> get unitTypeValues => _unitTypeValues;

  String get publicUnitValue => _publicUnitValue;
  List<String> get publicAdvanceUnitValue => _publicAdvanceUnitValue;

  String get publicTransitHintText => _publicTransitHintText;

  String get airTravelUnitDropdownValue => _airTravelUnitDropdownValue;

  String get airTravelHintText => _airTravelHintText;

  List<TextEditingController> get vehicleControllers => _vehicleControllers;

  bool get disableDropdownbuttons => _disableDropdownButtons;

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

  void addTextEditController() {
    _vehicleControllers.add(new TextEditingController());
  }

  void showVehicleUI() {
    addMPGValue();
    addFuelTypeValue();
    addUnitTypeValue();
    addTextEditController();
    _vehicleCount++;
    _transportationModel =
        _transportationModel.copyWith(numberOfVehicle: _vehicleCount);

    notifyListeners();
  }

  void removeVehicleUI() {
    if (_vehicleCount > 0) {
      _mpgValues.removeLast();
      _vehicleCount--;
      _transportationModel =
          _transportationModel.copyWith(numberOfVehicle: _vehicleCount);
      _vehicleControllers.removeLast();
      _vehiclesMap.clear();
      notifyListeners();
    }
  }

  void updateMPGValue(double val, int curr) {
    _mpgValues[curr] = val;
    _vehiclesMap.update(curr, (value) {
      _vehicleModel =
          _vehicleModel.copyWith(mpgValue: '${val.toStringAsFixed(1)} mpg');
      return _vehicleModel;
    });
    notifyListeners();
  }

  updateFuelDropdown(String? type, int i) {
    if (type == null) {
      return;
    }

    _fuelTypeValues[i] = type;
    _vehiclesMap.update(i, (value) {
      _vehicleModel = _vehicleModel.copyWith(fuelType: type);
      return _vehicleModel;
    });

    notifyListeners();
  }

  void updateUnitDropdown(String? item, int i) {
    if (item == null) {
      return;
    }
    _unitTypeValues[i] = item;
    _vehiclesMap.update(i, (value) {
      _vehicleModel = _vehicleModel.copyWith(unitType: item);
      return _vehicleModel;
    });
    notifyListeners();
  }

  void updatePublicUnitDropdownValue(String? unit) {
    final isMile = unit == 'Mi';
    if (!_validateDropdownValue(unit)) {
      return;
    }
    _publicTransitHintText = isMile ? '368 Mi/year' : '600 km/year';
    _publicUnitValue = unit!;
    _transportationModel =
        _transportationModel.copyWith(publicTransitUnit: _publicUnitValue);
    notifyListeners();
  }

  bool _validateDropdownValue(String? unit) {
    return unit != null;
  }

  void updatePublicAdvanceDropdownValues(String? unit, int index) {
    if (!_validateDropdownValue(unit)) {
      return;
    }
    final isMile = unit == 'Mi';
    if (isMile) {
      _publicTransitList[index].hinText = _convertUnit(index);
    }

    _publicAdvanceUnitValue[index] = unit!;
    switch (index) {
      case 0:
        _transportationModel =
            _transportationModel.copyWith(busUnit: _publicAdvanceUnitValue[0]);
        break;
      case 1:
        _transportationModel = _transportationModel.copyWith(
            transitRailUnit: _publicAdvanceUnitValue[1]);
        break;
      case 2:
        _transportationModel = _transportationModel.copyWith(
            commuterRailUnit: _publicAdvanceUnitValue[2]);
        break;
      case 3:
        _transportationModel = _transportationModel.copyWith(
            interCityRailUnit: _publicAdvanceUnitValue[3]);
        break;
      default:
    }

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
      return;
    }
    final isMile = unit == 'Mi';

    _airTravelHintText = isMile ? '3,300 mile/year' : '5000 km/year';

    _airTravelUnitDropdownValue = unit!;
    _transportationModel = _transportationModel.copyWith(
        airTravelUnit: _airTravelUnitDropdownValue);
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
      return;
    }
    this._airTravelList[index].dropdownValue = 'Flight/$val';
    switch (index) {
      case 0:
        _transportationModel = _transportationModel.copyWith(
            shortTravelByAir: _airTravelList[0].dropdownValue);
        break;
      case 1:
        _transportationModel = _transportationModel.copyWith(
            mediumTravelByAir: _airTravelList[1].dropdownValue);
        break;
      case 2:
        _transportationModel = _transportationModel.copyWith(
            longTravelByAir: _airTravelList[2].dropdownValue);
        break;
      case 3:
        _transportationModel = _transportationModel.copyWith(
            extendedTravelByAir: _airTravelList[3].dropdownValue);
        break;
    }
    notifyListeners();
  }

  bool _validateInput() {
    if (_vehicleCount > 0 && _vehiclesMap.isEmpty) {
      return false;
    } else if (_isSimple &&
        (_publicTextEditController.text.isEmpty ||
            _airTextEditController.text.isEmpty)) {
      return false;
    }

    return true;
  }

  void next() {
    // if (!_validateInput()) {
    //   promptDialog(
    //     showErrorAlert: true,
    //     dialogService: _dialogService,
    //     title: 'All field are required',
    //     message: "Answer the required fields",
    //   );
    //   return;
    // }
    _transportationModel =
        _transportationModel.copyWith(vehicle: _vehiclesMap.values.toList());
    print(_transportationModel.toString());
    questionaireMap.addToCategory(
        _transportationModel.questionID, _transportationModel);
    print('category map count: ${questionaireMap.categoryMap.length}');
    QuestionaireViewModel.nextQuestionScreen();
  }

  void convertUtils(String input, String unit) {
    //TODO: convert km to mi
    final bool isKiloMeter = unit == 'km';
  }

  void onVehicleInputChanged(String? input, int index) {
    if (input == null) return;
    if (!validateUserInput(input)) {
      promptDialog(
          dialogService: _dialogService,
          title: "Invalid input",
          showErrorAlert: true,
          message:
              "Please enter total kilo meter or miles you have driven over the year.");
      input = '';
      return;
    }
    _disableDropdownButtons = false;
    notifyListeners();
    if (_vehiclesMap.containsKey(index)) {
      _vehiclesMap.remove(index);
    }
    _vehiclesMap.putIfAbsent(
      index,
      () {
        _vehicleModel =
            _vehicleModel.copyWith(totalDrivenPerYear: int.parse(input!));

        return _vehicleModel;
      },
    );

    print('vehicle map list count: ${_vehiclesMap.length}');
    print('disable button == $_disableDropdownButtons ');
  }

  void onAdvancePublicTransitInputChanged(String? input, int index) {
    if (input == null || index < 0) return;
    if (!validateUserInput(input)) {
      promptDialog(
          showErrorAlert: true,
          dialogService: _dialogService,
          title: "Invalid input",
          message:
              "Please enter number of times you have travel over the year.");
      _publicTransitList[index].textEditingController.clear();
      return;
    }
    switch (index) {
      case 0:
        _transportationModel = _transportationModel.copyWith(bus: input);
        break;
      case 1:
        _transportationModel =
            _transportationModel.copyWith(transitRail: input);
        break;
      case 2:
        _transportationModel =
            _transportationModel.copyWith(commuterRail: input);
        break;
      case 3:
        _transportationModel =
            _transportationModel.copyWith(interCityRail: input);
        break;
    }
  }

  void onAdvanceAirTravelInput(String? input, int index) {
    if (input == null || index < 0) return;
    if (!validateUserInput(input)) {
      promptDialog(
          dialogService: _dialogService,
          title: "Invalid input",
          showErrorAlert: true,
          message:
              "Please enter number of times you have travel over the year.");
      _airTravelList[index].textEditingController.clear();
      return;
    }
    switch (index) {
      case 0:
        _transportationModel =
            _transportationModel.copyWith(numberOfShortTravelByAir: input);

        break;
      case 1:
        _transportationModel =
            _transportationModel.copyWith(numberOfMediumTravelByAir: input);

        break;
      case 2:
        _transportationModel =
            _transportationModel.copyWith(numberOfLongTravelByAir: input);

        break;
      case 3:
        _transportationModel =
            _transportationModel.copyWith(numberOfExtendedTravelByAir: input);

        break;
      default:
    }
  }

  void onSimplePublicTransitChanged(String? input) {
    if (input == null) return;
    if (!validateUserInput(input)) {
      promptDialog(
          showErrorAlert: true,
          dialogService: _dialogService,
          title: "Invalid input",
          message:
              "Please enter number of kilo meter or miles you have travel over the year using public transit.");
      _publicTextEditController.clear();
      return;
    }

    _transportationModel =
        _transportationModel.copyWith(totalPublicTransitPerYear: input);
  }

  void onSimpleAirTravelChanged(String? input) {
    if (input == null) return;
    if (!validateUserInput(input)) {
      promptDialog(
          showErrorAlert: true,
          dialogService: _dialogService,
          title: "Invalid input",
          message:
              "Please enter number of times you have travel over the year.");

      _airTextEditController.clear();
      return;
    }

    _transportationModel =
        _transportationModel.copyWith(totalAirTravelPerYear: input);
  }
}
