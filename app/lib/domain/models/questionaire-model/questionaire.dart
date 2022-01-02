import 'dart:collection';

import 'package:app/domain/models/questionaire-model/category.dart';

class Questionaire {
  final Map<String, Category> _category;
  Questionaire(this._category);

  UnmodifiableMapView<String, Category> get categoryMap =>
      UnmodifiableMapView(this._category);

  void addToCategory(String questionID, Category category) {
    removeIfAbsent(questionID);
    this._category.putIfAbsent(questionID, () => category);
  }

  void removeIfAbsent(String question) {
    if (this._category.containsKey(question)) {
      this._category.remove(question);
    }
  }
}
