import 'dart:collection';

import 'package:app/common/constant.dart';
import 'package:app/common/utils/prompt_dialog.dart';
import 'package:app/common/utils/url_link.dart';
import 'package:app/domain/models/questionaire-model/category.dart';
import 'package:app/domain/models/questionaire-model/concrete-objects/food.dart';
import 'package:app/domain/models/questionaire-model/questionaire.dart';
import 'package:app/domain/services/dialog_service/dialog_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/main.dart';
import 'package:app/ui/widgets/text-widgets/label_title_widget.dart';

import '../questionaire-viewmodel.dart';

class FoodViewModel extends BaseViewModel {
  final _dialogService = locator<DiaglogService>();
  var _foodModel = Food(
    meatFishEggs: 2.6,
    questionID: 'Q3',
    grainsAndBakedGoods: 4.5,
    diary: 2.4,
    fruitsAndVegatables: 4.6,
    snacksAndDrinks: 3.7,
    meatOtherBeefLambPork: 1.8,
    otherMeat: 0.3,
    fishAndSeafood: 0.4,
    poultryAndEggs: 0.3,
  );

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

  double get seaFoodValue => _seaFoodValue;

  double get otherMeat => _otherMeat;
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
    _foodModel = _foodModel.copyWith(fruitsAndVegatables: val);
    notifyListeners();
  }

  void onMeatChange(double meat) {
    if (_isSimple) {
      this._meatSimpleValue = meat;
      _foodModel = _foodModel.copyWith(meatFishEggs: meat);
      notifyListeners();
      return;
    } else {
      this._meatAdvanceValue = meat;
      _foodModel = _foodModel.copyWith(meatOtherBeefLambPork: meat);
      notifyListeners();
    }
  }

  void onAdvance() {
    changedMode();
  }

  void changedMode() {
    _isSimple = !_isSimple;
    _foodModel = _foodModel.copyWith(isSimple: _isSimple);
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
    _foodModel = _foodModel.copyWith(grainsAndBakedGoods: val);
    notifyListeners();
  }

  void updateDairyValue(double val) {
    _dairyValue = val;
    _foodModel = _foodModel.copyWith(diary: val);
    notifyListeners();
  }

  void updateSnackAndDrinkValue(double val) {
    _snackAndDrinkValue = val;
    _foodModel = _foodModel.copyWith(snacksAndDrinks: val);
    notifyListeners();
  }

  void updateSeafoodAdvanceMeatValue(double val) {
    _seafoodAdvanceMeatValue = val;
    _foodModel = _foodModel.copyWith(fishAndSeafood: val);
    notifyListeners();
  }

  void updateOtherMeat(double val) {
    _otherMeat = val;
    _foodModel = _foodModel.copyWith(otherMeat: val);
    notifyListeners();
  }

  void updateEggsAndPoultryValue(double val) {
    _eggsAndPoultryValue = val;
    _foodModel = _foodModel.copyWith(poultryAndEggs: val);
    notifyListeners();
  }

  void next() {
    print('food model : ${_foodModel.toString()}');
    questionaireMap.addToCategory(_foodModel.questionID, _foodModel);
    QuestionaireViewModel.nextQuestionScreen();
  }
}
