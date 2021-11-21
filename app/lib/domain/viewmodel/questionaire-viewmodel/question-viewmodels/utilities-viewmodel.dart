import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';

class UtilitiesViewModel extends BaseViewModel {
  var _sliderValue = 0.0;

  double get sliderValue => _sliderValue;

  void onSliderChange(double value) {
    _sliderValue = value;
    notifyListeners();
  }

  void defaultSliderValue() {}
}
