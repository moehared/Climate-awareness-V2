import 'package:app/common/constant.dart';
import 'package:app/common/utils/prompt_dialog.dart';

import 'package:app/domain/models/questionaire-model/concrete-objects/utilities.dart';

import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/questionaire-viewmodel.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';

class UtilitiesViewModel extends BaseViewModel {
  var _waterValue = 0.0;
  final electricty = 'Electricty';
  var _heatingHelperText = '';
  var _electrictyHelperText = '';
  var _naturalHelperText = '';

  var _livingSpaceAreaHelperText = '';
  final naturalGas = 'Natural Gas';
  final heatingAndOthers = 'Heating Oil & Other Fuels';
  final livingSpace = 'Living space area';
  final waterUsage = 'Water Usage';
  var _heatingHintText = '\$24/mo';
  var _heatingDropdownValue = '\$';
  var _naturalGasHintText = '48/mo';
  var _naturalGasUnitCostValue = '\$';
  var _naturalGasAnnualValue = '/mo';
  var _utilitiesModel = Utilities(
      electrictyBill: "",
      questionID: 'Q1',
      electricityType: 0,
      electrictyUnitCost: "\$",
      electrictyFreqeuncyType: "/mo",
      dollarPerElectricty: "",
      dollarHeatingOil: 0,
      dollarPerYearNaturalGas: 0,
      dollarGallonHeatingOil: 0,
      heatingOilType: 0,
      naturalGasType: 0,
      thermsPerYearNaturalGas: 0,
      naturalBill: "",
      kwhPerElectricity: '',
      naturalUnitCost: "\$",
      naturalFreqeuncyType: "/mo",
      livingSpaceArea: "",
      waterUsage: "");

  final _dialogService = locator<DiaglogService>();

  var _heatingAnnualDropdownValue = '/mo';
  final _electrictyController = TextEditingController();
  final _heatingController = TextEditingController();
  final _naturalGasController = TextEditingController();
  final _livingSpaceController = TextEditingController();
  final _naturalGasFocusNode = FocusNode();
  final _heatingFocusNode = FocusNode();
  final _spaceLivingFocusNode = FocusNode();
  TextEditingController get electrictyController => _electrictyController;
  TextEditingController get heatingController => _heatingController;
  TextEditingController get naturalGasController => _naturalGasController;
  TextEditingController get livingSpaceController =>
      this._livingSpaceController;
  FocusNode get naturalGasFocusNode => _naturalGasFocusNode;
  FocusNode get heatingFocusNode => _heatingFocusNode;
  FocusNode get livingSpaceFocusNode => _spaceLivingFocusNode;
  double get waterSliderValue => _waterValue;
  Utilities get utilites => _utilitiesModel;

  var _electrictyOccurenceValue = '/mo';
  var _electrictyCostValue = '\$';
  var _electrictyHintText = '\$92/month';

  get electrictyCostValue => _electrictyCostValue;

  String get electrictyOccurenceValue => _electrictyOccurenceValue;

  String get electrictyHintText => _electrictyHintText;

  String get heatingDropdownValue => _heatingDropdownValue;

  String get heatingAnnuallyValue => _heatingAnnualDropdownValue;

  String get heatingHintText => _heatingHintText;
  String get naturalGasHintText => _naturalGasHintText;
  String get naturalGasUnitCostValue => _naturalGasUnitCostValue;
  String get naturalGasAnnualValue => _naturalGasAnnualValue;

  String get heatingHelperText => _heatingHelperText;
  String get electrictyHelperText => _electrictyHelperText;
  String get naturalHelperText => _naturalHelperText;
  String get livingSpaceAreaHelperText => _livingSpaceAreaHelperText;

  void showHeatingInfo() {
    promptDialog(
      message: HEATING_INFO_TEXT,
      dialogService: _dialogService,
      title: heatingAndOthers,
    );
  }

  void showElectrictyInfo() {
    promptDialog(
      message: ELECTRICITY_INFO_TEXT,
      dialogService: _dialogService,
      title: electricty,
    );
  }

  void showWaterHelpInfo() {
    promptDialog(
      message: WATER_USAGE_INFO_TEXT,
      dialogService: _dialogService,
      title: waterUsage,
    );
  }

  void showLivingSpaceInfo() {
    promptDialog(
      message: LIVING_SPACE_INFO_TEXT,
      dialogService: _dialogService,
      title: livingSpace,
    );
  }

  void showNaturalHelpInfo() {
    promptDialog(
      message: NATURAL_INFO_TEXT,
      dialogService: _dialogService,
      title: naturalGas,
    );
  }

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

  void setAnnualElectricCityDropdown(String? item) {
    if (item == null) return;

    _electrictyOccurenceValue = item;
    notifyListeners();
    _determineElectricyHintText(
        _electrictyCostValue, _electrictyOccurenceValue);
  }

  void _determineElectricyHintText(String costType, String annualType,
      [bool isHint = true]) {
    var electricityType = 0;
    final isMonthlyValue = annualType == '/mo';
    final isMoney = costType == '\$';
    var frequency = '';
    var costVal = '';
    if (isHint && _electrictyController.text.isEmpty) {
      if (isMoney) {
        _electrictyHintText = isMonthlyValue ? '\$92/month' : '\$1,104/year';
      } else {
        _electrictyHintText = isMonthlyValue ? '917/kWh' : '11,000/kWh';
      }
    } else {
      final cost = int.tryParse(_electrictyController.text);

      if (isMoney) {
        electricityType = 0;
        costVal = isMonthlyValue ? '${cost! * 12}' : '$cost!';
        frequency =
            isMonthlyValue ? '\$$cost per month' : '\$${cost! * 12} per year';
        _utilitiesModel =
            _utilitiesModel.copyWith(dollarPerElectricty: costVal);
      } else {
        electricityType = 1;
        costVal = isMonthlyValue ? '${cost! * 12}' : '$cost!';
        frequency = isMonthlyValue
            ? '$cost/kWh per month'
            : '${cost! * 12}/kWh per year';
        _utilitiesModel = _utilitiesModel.copyWith(kwhPerElectricity: costVal);
      }
    }

    _utilitiesModel =
        _utilitiesModel.copyWith(electricityType: electricityType);
    _electrictyHelperText = frequency;

    notifyListeners();
  }

  void _determineHeatingHintText(String costType, String annualType,
      [bool isHint = true]) {
    final isMonthlyValue = annualType == '/mo';
    final isMoney = costType == '\$';

    int? heatingCost = 0;
    var frequency = '';
    if (isHint && _heatingController.text.isEmpty) {
      if (isMoney) {
        _heatingHintText = isMonthlyValue ? '\$24/month' : '\$290/year';
      } else {
        _heatingHintText = isMonthlyValue ? '8/gal' : '97/gal';
      }
    } else {
      final cost = int.tryParse(_heatingController.text);

      if (isMoney) {
        heatingCost = isMonthlyValue ? cost! * 12 : cost!;
        frequency =
            isMonthlyValue ? '\$$cost per month' : '\$${cost * 12} per year';
        _utilitiesModel = _utilitiesModel.copyWith(
            dollarHeatingOil: heatingCost, heatingOilType: 0);
      } else {
        heatingCost = isMonthlyValue ? cost! * 12 : cost!;
        frequency = isMonthlyValue
            ? '$cost/gal per month'
            : '${cost * 12}/gal per year';
        _utilitiesModel = _utilitiesModel.copyWith(
            gallonHeatingOil: heatingCost, heatingOilType: 1);
      }
    }

    _heatingHelperText = frequency;

    notifyListeners();
  }

  void _determineNaturalGasHintText(String costType, String annualType,
      [bool isHint = true]) {
    final isMonthlyValue = annualType == '/mo';
    final isTherms = costType == 'therms';
    final isMoney = costType == '\$';
    var frequency = '';
    int? naturalCost;
    if (isHint && _naturalGasController.text.isEmpty) {
      if (isMoney) {
        _naturalGasHintText = isMonthlyValue ? '\$40/month' : '\$480/year';
      } else if (isTherms) {
        _naturalGasHintText = isMonthlyValue ? '31/month' : '378/year';
      } else {
        _naturalGasHintText = isMonthlyValue ? '3,150/ft³' : '37,795/ft³';
      }
    } else {
      final cost = int.tryParse(_heatingController.text);
      naturalCost = isMonthlyValue ? cost! * 12 : cost;
      if (isMoney) {
        frequency =
            isMonthlyValue ? '\$$cost per month' : '\$${cost! * 12} per year';
        _utilitiesModel = _utilitiesModel.copyWith(
            dollarPerYearNaturalGas: naturalCost, naturalGasType: 0);
      } else if (isTherms) {
        _utilitiesModel = _utilitiesModel.copyWith(
            thermsPerYearNaturalGas: naturalCost, naturalGasType: 1);
        frequency =
            isMonthlyValue ? '$cost per month' : '${cost! * 12} per year';
      } else {
        _utilitiesModel = _utilitiesModel.copyWith(
          naturalGasType: 2,
        );
        frequency = isMonthlyValue
            ? '$cost/ft³ per month'
            : '${cost! * 12}/ft³ per year';
      }
    }

    _naturalHelperText = frequency;

    notifyListeners();
  }

  void onBillTypeChange(String? item) {
    if (item == null) return;

    _electrictyCostValue = item;
    notifyListeners();
    _determineElectricyHintText(
        _electrictyCostValue, _electrictyOccurenceValue);
  }

  void onHeatingDropdownChanged(String? type) {
    if (type == null) return;
    _heatingDropdownValue = type;
    _determineHeatingHintText(
        _heatingDropdownValue, _heatingAnnualDropdownValue);
  }

  onAnnualDropdownValue(String? item) {
    if (item == null) return;
    _heatingAnnualDropdownValue = item;
    _determineHeatingHintText(
        _heatingDropdownValue, _heatingAnnualDropdownValue);
  }

  void onNaturalGasCostUnitChange(String? type) {
    if (type == null) return;
    _naturalGasUnitCostValue = type;
    _determineNaturalGasHintText(
        _naturalGasUnitCostValue, naturalGasAnnualValue);
  }

  void onNaturalGasAnnualChange(String? item) {
    if (item == null) return;
    _naturalGasAnnualValue = item;
    _determineNaturalGasHintText(
        _naturalGasUnitCostValue, _naturalGasAnnualValue);
  }

  bool isValid() {
    if (_electrictyController.text.isEmpty ||
        _electrictyCostValue.isEmpty ||
        _electrictyOccurenceValue.isEmpty ||
        _heatingController.text.isEmpty ||
        _heatingDropdownValue.isEmpty ||
        _heatingAnnualDropdownValue.isEmpty ||
        _naturalGasController.text.isEmpty ||
        _naturalGasAnnualValue.isEmpty ||
        _naturalGasUnitCostValue.isEmpty ||
        _livingSpaceController.text.isEmpty) {
      return false;
    }
    return true;
  }

  void next() {
    if (!isValid()) {
      promptDialog(
        message:
            'Answer all the required fields before proceeding to the next question ',
        dialogService: _dialogService,
        title: 'required field\n',
        showErrorAlert: true,
      );

      return;
    }

    _utilitiesModel = _utilitiesModel.copyWith(
      livingSpaceArea: _livingSpaceController.text,
      waterUsage: _waterValue.toString(),
      electrictyFreqeuncyType: _electrictyOccurenceValue,
      electrictyUnitCost: _electrictyCostValue,
      naturalFreqeuncyType: _naturalGasAnnualValue,
      naturalUnitCost: _naturalGasUnitCostValue,
    );
    _determineHeatingHintText(
        _heatingDropdownValue, _heatingAnnualDropdownValue, false);

    _determineElectricyHintText(
        _electrictyCostValue, _electrictyOccurenceValue, false);
    questionaireMap.addToCategory(_utilitiesModel.questionID, _utilitiesModel);
    print(_utilitiesModel.toString());
    print('category len = ${questionaireMap.categoryMap.length}');
    QuestionaireViewModel.nextQuestionScreen();
  }

  void onHeatingInputTextChanged(String? input) {
    if (input == null) return;
    _heatingHelperText = '\$$input/ per month';
    notifyListeners();
  }

  void onElectrictyInputChanged(String? input) {
    if (input == null) return;
    _electrictyHelperText = '\$$input/ per month';
    notifyListeners();
  }

  void onNaturalInputChanged(String? input) {
    if (input == null) return;
    _naturalHelperText = '\$$input/ per month';
    notifyListeners();
  }

  void onLivingSpaceAreaInputChanged(String? input) {
    if (input == null) return;
    _livingSpaceAreaHelperText = '$input/ft²';
    notifyListeners();
  }
}
