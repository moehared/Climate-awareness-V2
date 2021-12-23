import 'package:app/common/constant.dart';
import 'package:app/common/utils/prompt_dialog.dart';
import 'package:app/common/utils/url_link.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/ui/widgets/text-widgets/label_title_widget.dart';

class FoodViewModel extends BaseViewModel {
  final _dialogService = locator<DiaglogService>();

  var _isSimple = true;
  var _seaFoodValue = 0.0;
  var _otherMeat = 0.3;
  double _meatSimpleValue = 2.6;
  double _meatAdvanceValue = 1.8;
  var _snackAndDrinkValue = 3.7;
  var _grainValue = 4.5;
  var _dairyValue = 2.4;
  var _seafoodAdvanceMeatValue = 0.4;
  var _fruitsAndVegetableValue = 4.5;
  var _eggsAndPoultryValue = 0.3;
  get isSimple => _isSimple;

  get seaFoodValue => _seaFoodValue;

  get otherMeat => _otherMeat;
  double get simpleMeatValue => _meatSimpleValue;
  double get advanceMeatValue => _meatAdvanceValue;

  double get grainValue => _grainValue;

  double get dairyValue => _dairyValue;

  double get fruitAndVegetableValue => _fruitsAndVegetableValue;

  double get snackAndDrinkValue => _snackAndDrinkValue;

  get seafoodAdvanceMeatValue => _seafoodAdvanceMeatValue;

  double get eggsAndPoultryValue => _eggsAndPoultryValue;

  void updateFruitsAndVegetableValue(val) {
    _fruitsAndVegetableValue = val;
    notifyListeners();
  }

  void onMeatChange(double meat) {
    if (_isSimple) {
      this._meatSimpleValue = meat;
      notifyListeners();
      return;
    } else {
      this._meatAdvanceValue = meat;
      notifyListeners();
    }
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

  void showHelpText() {
    promptDialog(
      title: 'House Hold Food Information',
      dialogService: _dialogService,
      child: BuildRichText(
        label: FOOD_HELP_TEXT,
        linkLabel: 'Here',
        onTap: () => launchInBrowser(FOOD_INFO_URL),
      ),
    );
  }

  void updateGrainValue(double val) {
    _grainValue = val;
    notifyListeners();
  }

  void updateDairyValue(double val) {
    _dairyValue = val;
    notifyListeners();
  }

  void updateSnackAndDrinkValue(double val) {
    _snackAndDrinkValue = val;
    notifyListeners();
  }

  void updateSeafoodAdvanceMeatValue(double val) {
    _seafoodAdvanceMeatValue = val;
    notifyListeners();
  }

  void updateOtherMeat(double val) {
    _otherMeat = val;
    notifyListeners();
  }

  void updateEggsAndPoultryValue(double val) {
    _eggsAndPoultryValue = val;
    notifyListeners();
  }
}
