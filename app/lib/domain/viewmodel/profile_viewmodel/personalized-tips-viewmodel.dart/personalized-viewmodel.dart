import 'package:app/domain/models/questionaire-model/category.dart';
import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/main.dart';

class PersonalizedTipViewModelDetails extends BaseViewModel {
  dynamic? _category;

  dynamic? get category => _category;
  void getDetailsTips(String id) {
    _category = questionaireMap.categoryMap.values
        .firstWhere((element) => element.findById() == id);
    notifyListeners();
  }
}
