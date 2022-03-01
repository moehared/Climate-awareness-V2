import 'dart:convert';

import 'package:app/domain/models/questionaire-model/category.dart' as cat;
import 'package:flutter/foundation.dart';

class QuestionaireResult {
  final double? resultGrandTotal;
  final double? previousScore;
  final double? resultAirTravelDirect;

  final double? resultMotorVehiclesDirect;

  final double? resultPublictransDirect;

  final double? resultServicesTotal;

  final double? resultFoodTotal;

  final double? resultWaterSewage;

  final double? energy;
  final String? id;

  // final Map<String, cat.Category>? category;
  QuestionaireResult({
    this.resultGrandTotal,
    this.resultAirTravelDirect,
    this.resultMotorVehiclesDirect,
    this.resultPublictransDirect,
    this.resultServicesTotal,
    this.resultFoodTotal,
    this.resultWaterSewage,
    this.energy,
    this.previousScore,
    this.id,
    // this.category,
  });

  QuestionaireResult copyWith({
    double? resultGrandTotal,
    double? resultAirTravelDirect,
    double? resultMotorVehiclesDirect,
    double? resultPublictransDirect,
    double? resultServicesTotal,
    double? resultFoodTotal,
    double? resultWaterSewage,
    double? energy,
    String? id,
    double? previous,
    // Map<String, cat.Category>? category,
  }) {
    return QuestionaireResult(
      resultGrandTotal: resultGrandTotal ?? this.resultGrandTotal,
      previousScore: previous ?? this.previousScore,
      resultAirTravelDirect:
          resultAirTravelDirect ?? this.resultAirTravelDirect,
      resultMotorVehiclesDirect:
          resultMotorVehiclesDirect ?? this.resultMotorVehiclesDirect,
      resultPublictransDirect:
          resultPublictransDirect ?? this.resultPublictransDirect,
      resultServicesTotal: resultServicesTotal ?? this.resultServicesTotal,
      resultFoodTotal: resultFoodTotal ?? this.resultFoodTotal,
      resultWaterSewage: resultWaterSewage ?? this.resultWaterSewage,
      energy: energy ?? this.energy,
      id: id ?? this.id,
      // category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'resultGrandTotal': resultGrandTotal,
      'resultAirTravelDirect': resultAirTravelDirect,
      'resultMotorVehiclesDirect': resultMotorVehiclesDirect,
      'resultPublictransDirect': resultPublictransDirect,
      'resultServicesTotal': resultServicesTotal,
      'resultFoodTotal': resultFoodTotal,
      'resultWaterSewage': resultWaterSewage,
      'energy': energy,
      'previous': previousScore,
      'id': id,
      // 'category': this.category?.map((key, value) => MapEntry(key, value)),
      //  'category': category,
    };
  }

  factory QuestionaireResult.fromMap(Map<String, dynamic> map) {
    return QuestionaireResult(
      resultGrandTotal: map['resultGrandTotal']?.toDouble(),
      resultAirTravelDirect: map['resultAirTravelDirect']?.toDouble(),
      resultMotorVehiclesDirect: map['resultMotorVehiclesDirect']?.toDouble(),
      resultPublictransDirect: map['resultPublictransDirect']?.toDouble(),
      resultServicesTotal: map['resultServicesTotal']?.toDouble(),
      resultFoodTotal: map['resultFoodTotal']?.toDouble(),
      resultWaterSewage: map['resultWaterSewage']?.toDouble(),
      energy: map['energy']?.toDouble(),
      id: map['id'],
      previousScore: map['previous']
      // category: Map<String, cat.Category>.from(map['category']),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionaireResult.fromJson(String source) =>
      QuestionaireResult.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuestionaireResult(resultGrandTotal: $resultGrandTotal, resultAirTravelDirect: $resultAirTravelDirect, resultMotorVehiclesDirect: $resultMotorVehiclesDirect, resultPublictransDirect: $resultPublictransDirect, resultServicesTotal: $resultServicesTotal, resultFoodTotal: $resultFoodTotal, resultWaterSewage: $resultWaterSewage, energy: $energy, id: $id previousScore: $previousScore)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionaireResult &&
        other.resultGrandTotal == resultGrandTotal &&
        other.resultAirTravelDirect == resultAirTravelDirect &&
        other.resultMotorVehiclesDirect == resultMotorVehiclesDirect &&
        other.resultPublictransDirect == resultPublictransDirect &&
        other.resultServicesTotal == resultServicesTotal &&
        other.resultFoodTotal == resultFoodTotal &&
        other.resultWaterSewage == resultWaterSewage &&
        other.energy == energy &&
        other.previousScore == previousScore &&
        other.id == id;
//         &&
//  mapEquals(other.category, category);
  }

  @override
  int get hashCode {
    return resultGrandTotal.hashCode ^
        resultAirTravelDirect.hashCode ^
        resultMotorVehiclesDirect.hashCode ^
        resultPublictransDirect.hashCode ^
        resultServicesTotal.hashCode ^
        resultFoodTotal.hashCode ^
        resultWaterSewage.hashCode ^
        energy.hashCode ^
        previousScore.hashCode ^
        id.hashCode;
    // ^
    // category.hashCode;
  }
}
