import 'package:app/common/constant.dart';
import 'package:app/common/utils/input_validator.dart';
import 'package:app/common/utils/prompt_dialog.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/goods_services.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/goods-viewmodel/goods_model.dart'
    as goods;

import '../../../../main.dart';

class GoodsServicesViewModel extends BaseViewModel {
  var _goodsValue = 500.0;
  var _serviceValue = 300.0;
  var _isSimple = true;

  var _goodsServicesModel = GoodsServices(
      totalGoodsSpent: 500,
      questionId: 'Q4',
      totalServiceSpent: 300,
      furnitureAndAppliance: '',
      clothing: '',
      entertaining: '',
      paperOfficeReading: '',
      personalCare: '',
      autoParts: '',
      medical: '',
      healthCare: '',
      informationAndCommunication: '',
      organizationAndCharity: '',
      vehicleService: '',
      houseHoldMaintenanceAndRepair: '',
      otherService: '');
  final _dialogService = locator<DiaglogService>();
  final _goodsList = goods.goodsList;
  final _servicesList = goods.serviceList;
  double get goodsValue => _goodsValue;

  double get servicesValue => _serviceValue;

  bool get isSimple => _isSimple;

  List<goods.GoodsModel> get goodsList => _goodsList;
  List<goods.ServiceModel> get servicesList => _servicesList;
  void onGoodsChange(value) {
    this._goodsValue = value;
    _goodsServicesModel = _goodsServicesModel.copyWith(totalGoodsSpent: value);
    notifyListeners();
  }

  onServiceChange(double val) {
    this._serviceValue = val;
    _goodsServicesModel = _goodsServicesModel.copyWith(totalServiceSpent: val);
    notifyListeners();
  }

  void onSimpleClick() {
    _changeMode();
  }

  void _changeMode() {
    this._isSimple = !this._isSimple;
    notifyListeners();
  }

  void onAdvanceClick() {
    _changeMode();
  }

  void onTextLink() {}
  void onContinue() {
    print(_goodsServicesModel.toString());
    categoryMap.addToCategory(
        _goodsServicesModel.questionId, _goodsServicesModel);
    print('category map count: ${categoryMap.categoryMap.length}');
  }

  void showGoodsAndServiceHelpInfo() {
    promptDialog(
        title: 'Select How much you spent on Goods And service',
        message: GOODS_HELP_TEXT,
        dialogService: _dialogService);
  }

  void onAdvanceGoodsInputChanged(int index) {
    if (!validateUserInput(_goodsList[index].textEditingController.text) &&
        index >= 0) {
      promptDialog(
          showErrorAlert: true,
          dialogService: _dialogService,
          title: "Invalid input",
          message:
              "Only valid input is number. Enter the amount you spent in each text field");
      _goodsList[index].textEditingController.clear();
      return;
    }
    switch (index) {
      case 0:
        _goodsServicesModel = _goodsServicesModel.copyWith(
            furnitureAndAppliance: _goodsList[0].textEditingController.text);
        break;
      case 1:
        _goodsServicesModel = _goodsServicesModel.copyWith(
            clothing: _goodsList[1].textEditingController.text);
        break;
      case 2:
        _goodsServicesModel = _goodsServicesModel.copyWith(
            entertaining: _goodsList[2].textEditingController.text);
        break;
      case 3:
        _goodsServicesModel = _goodsServicesModel.copyWith(
            paperOfficeReading: _goodsList[3].textEditingController.text);
        break;
      case 4:
        _goodsServicesModel = _goodsServicesModel.copyWith(
            personalCare: _goodsList[4].textEditingController.text);
        break;
      case 5:
        _goodsServicesModel = _goodsServicesModel.copyWith(
            autoParts: _goodsList[5].textEditingController.text);
        break;
    }
  }

  void onAdvanceServiceInputChanged(int index) {
    switch (index) {
      case 0:
        _goodsServicesModel = _goodsServicesModel.copyWith(
            healthCare: _servicesList[0].textEditingController.text);
        break;
      case 1:
        _goodsServicesModel = _goodsServicesModel.copyWith(
            medical: _servicesList[1].textEditingController.text);
        break;
      case 2:
        _goodsServicesModel = _goodsServicesModel.copyWith(
            informationAndCommunication:
                _servicesList[2].textEditingController.text);
        break;
      case 3:
        _goodsServicesModel = _goodsServicesModel.copyWith(
            organizationAndCharity:
                _servicesList[3].textEditingController.text);
        break;
      case 4:
        _goodsServicesModel = _goodsServicesModel.copyWith(
            vehicleService: _servicesList[4].textEditingController.text);
        break;
      case 5:
        _goodsServicesModel = _goodsServicesModel.copyWith(
            personalCare: _servicesList[5].textEditingController.text);
        break;
      case 6:
        _goodsServicesModel = _goodsServicesModel.copyWith(
            houseHoldMaintenanceAndRepair:
                _servicesList[6].textEditingController.text);
        break;
      case 7:
        _goodsServicesModel = _goodsServicesModel.copyWith(
            otherService: _servicesList[7].textEditingController.text);
        break;
    }
  }
}
