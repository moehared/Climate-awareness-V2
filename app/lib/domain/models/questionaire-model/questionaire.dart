import 'dart:collection';
import 'dart:convert';

import 'package:app/domain/models/questionaire-model/category.dart' as cat;
import 'package:app/domain/models/questionaire-model/questionaire-result.dart';
import 'package:flutter/foundation.dart';

class Questionaire {
  Map<String, cat.Category> _category;
  Questionaire(this._category, {required this.result});

  QuestionaireResult result;

  UnmodifiableMapView<String, cat.Category> get categoryMap =>
      UnmodifiableMapView(this._category);
  set setCategoryMap(Map<String, cat.Category> map) {
    this._category = Map<String, cat.Category>.from(map);
  }

  void addToCategory(String questionID, cat.Category category) {
    removeIfAbsent(questionID);
    this._category.putIfAbsent(questionID, () => category);
  }

  Questionaire copyWith(
      {required Map<String, cat.Category>? category,
      required QuestionaireResult result}) {
    return Questionaire(category ?? this._category, result: this.result);
  }

  void removeIfAbsent(String question) {
    if (this._category.containsKey(question)) {
      this._category.remove(question);
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'category': _category,
      'result': result,
    };
  }

  factory Questionaire.fromMap(Map<String, dynamic> map) {
    return Questionaire(Map<String, cat.Category>.from(map['category']),
        result: map['result']);
  }

  String toJson() => json.encode(toMap());

  factory Questionaire.fromJson(String source) =>
      Questionaire.fromMap(json.decode(source));

  @override
  String toString() => 'Questionaire(_category: $_category)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Questionaire && mapEquals(other._category, _category);
  }

  @override
  int get hashCode => _category.hashCode;
}
