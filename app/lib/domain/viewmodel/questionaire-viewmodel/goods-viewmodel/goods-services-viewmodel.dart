import 'package:app/common/constant.dart';
import 'package:app/common/utils/prompt_dialog.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/viewmodel/questionaire-viewmodel/goods-viewmodel/goods_model.dart'
    as goods;

class GoodsServicesViewModel extends BaseViewModel {
  var _goodsValue = 0.0;
  var _serviceValue = 0.0;
  var _isSimple = true;
  final _dialogService = locator<DiaglogService>();
  final _goodsList = goods.goodsList;
  final _servicesList = goods.serviceList;
  var _isValid = true;
  double get goodsValue => _goodsValue;

  double get servicesValue => _serviceValue;

  bool get isSimple => _isSimple;

  List<goods.GoodsModel> get goodsList => _goodsList;
  List<goods.ServiceModel> get servicesList => _servicesList;
  void onGoodsChange(value) {
    this._goodsValue = value;
    notifyListeners();
  }

  onServiceChange(double val) {
    this._serviceValue = val;
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
  void onContinue() {}



  void showGoodsAndServiceHelpInfo() {
    promptDialog(
        title: 'Select How much you spent on Goods And service',
        message: GOODS_HELP_TEXT,
        dialogService: _dialogService);
  }


}
