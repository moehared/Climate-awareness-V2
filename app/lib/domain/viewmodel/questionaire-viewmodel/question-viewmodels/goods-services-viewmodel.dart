import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';

class GoodsServicesViewModel extends BaseViewModel {
  var _goodsValue = 0.0;
  var _serviceValue = 0.0;
  double get goodsValue => _goodsValue;

  double get servicesValue => _serviceValue;

  void onGoodsChange(value) {
    this._goodsValue = value;
    notifyListeners();
  }

  onServiceChange(double val) {
    this._serviceValue = val;
    notifyListeners();
  }

  void onTextLink() {}
}
