import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';

class FoodViewModel extends BaseViewModel {
  double _meatValue = 2.7;
  double get onMeatValue => _meatValue;
  var _isSimple = true;
  var _seaFoodValue = 0.0;
  var _otherMeat = 0.0;

  get isSimple => _isSimple;

  get seaFoodValue => _seaFoodValue;

  get otherMeat => _otherMeat;

  onMeatChange(double meat) {
    this._meatValue = meat;
    notifyListeners();
  }

  void onAdvance() {
    changedMode();
  }

  void changedMode() {
    _isSimple = !_isSimple;
    notifyListeners();
  }

  void onSimple() {
    changedMode();
  }
}
