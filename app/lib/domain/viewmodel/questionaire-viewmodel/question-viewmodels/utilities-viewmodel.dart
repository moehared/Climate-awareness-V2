import 'package:app/common/constant.dart';
import 'package:app/common/utils/prompt_dialog.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/questionaire-viewmodel.dart';
import 'package:flutter/material.dart';

class UtilitiesViewModel extends BaseViewModel {
  var _waterValue = 0.0;
  final electricty = 'Electricty';
  final naturalGas = 'Natural Gas';
  final heatingAndOthers = 'Heating Oil & Other Fuels';
  final livingSpace = 'Living space area';
  final waterUsage = 'Water Usage';
  var _heatingHintText = '\$290/year';
  var _heatingDropdownValue = '\$';
  var _naturalGasHintText = '480/year';
  var _naturalGasUnitCostValue = '\$';
  var _naturalGasAnnualValue = '/mo';
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
  var _isValid = false;
  var _electrictyOccurenceValue = 'mo';
  var _electrictyCostValue = '\$';
  var _electrictyHintText = '\$92/month';

  get electrictyCostValue => _electrictyCostValue;

  get electrictyOccurenceValue => _electrictyOccurenceValue;

  String get electrictyHintText => _electrictyHintText;

  String get heatingDropdownValue => _heatingDropdownValue;

  String get heatingAnnuallyValue => _heatingAnnualDropdownValue;

  String get heatingHintText => _heatingHintText;
  String get naturalGasHintText => _naturalGasHintText;
  String get naturalGasUnitCostValue => _naturalGasUnitCostValue;
  String get naturalGasAnnualValue => _naturalGasAnnualValue;

  bool get isValid => _isValid;
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
    debugPrint('_electrictyOccurenceValue == $_electrictyHintText');
    debugPrint('monthly == $item');
    debugPrint('hint text == $_electrictyHintText');
    _electrictyOccurenceValue = item;
    notifyListeners();
    _determineElectricyHintText(
        _electrictyCostValue, _electrictyOccurenceValue);
  }

  void electrictyUserInput() {
    if (_electrictyController.text.isEmpty) return;
    debugPrint('user input: ${_electrictyController.text}');
    _electrictyHintText = _electrictyController.text;
    notifyListeners();
  }

  void _determineElectricyHintText(String costType, String annualType) {
    final isMonthlyValue = annualType == 'mo';
    final isMoney = costType == '\$';

    if (isMoney) {
      _electrictyHintText = isMonthlyValue ? '\$92/month' : '\$1,104/year';
    } else {
      _electrictyHintText = isMonthlyValue ? '917/kWh' : '11,000/kWh';
    }

    notifyListeners();
  }

  void _determineHeatingHintText(String costType, String annualType) {
    final isMonthlyValue = annualType == 'mo';
    final isMoney = costType == '\$';

    if (isMoney) {
      _heatingHintText = isMonthlyValue ? '\$24/month' : '\$290/year';
    } else {
      _heatingHintText = isMonthlyValue ? '8/gal' : '97/gal';
    }

    notifyListeners();
  }

  void _determineNaturalGasHintText(String costType, String annualType) {
    final isMonthlyValue = annualType == 'mo';
    final isTherms = costType == 'therms';
    final isMoney = costType == '\$';
    print('Is therms == $isTherms');
    if (isMoney) {
      _naturalGasHintText = isMonthlyValue ? '\$40/month' : '\$480/year';
    } else if (isTherms) {
      _naturalGasHintText = isMonthlyValue ? '31/month' : '378/year';
    } else {
      _naturalGasHintText = isMonthlyValue ? '3,150/ft³' : '37,795/ft³';
    }

    notifyListeners();
  }

  void onBillTypeChange(String? item) {
    if (item == null) return;
    print('money == $item');
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
    //TODO: Validate all inputs before allowing user to go next page
    if (item == null) return;
    _naturalGasAnnualValue = item;
    _determineNaturalGasHintText(
        _naturalGasUnitCostValue, _naturalGasAnnualValue);
  }

  void next() {
    if (!_isValid) {
      _isValid = true;
      promptDialog(
        message: 'error',
        dialogService: _dialogService,
        title: 'error',
        showErrorAlert: true,
      );
      notifyListeners();

      return;
    }
    QuestionaireViewModel.nextQuestionScreen();
  }
}
