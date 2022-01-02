import 'dart:convert';

import 'package:app/domain/models/questionaire-model/carbon-emission/carbon-emission.dart';

class Utilities extends CarbonEmission {
  final String electrictyBill;
  final String electrictyUnitCost;
  final String electrictyFreqeuncyType;
  final String questionID;
  final String heatingyBill;
  final String heatingUnitCost;
  final String heatingreqeuncyType;

  final String naturalBill;
  final String naturalUnitCost;
  final String naturalFreqeuncyType;
  final String livingSpaceArea;
  final String waterUsage;
  Utilities({
    required this.questionID,
    required this.electrictyBill,
    required this.electrictyUnitCost,
    required this.electrictyFreqeuncyType,
    required this.heatingyBill,
    required this.heatingUnitCost,
    required this.heatingreqeuncyType,
    required this.naturalBill,
    required this.naturalUnitCost,
    required this.naturalFreqeuncyType,
    required this.livingSpaceArea,
    required this.waterUsage,
  });

  Utilities copyWith({
    String? electrictyBill,
    String? electrictyUnitCost,
    String? electrictyFreqeuncyType,
    String? heatingyBill,
    String? heatingUnitCost,
    String? heatingreqeuncyType,
    String? naturalBill,
    String? naturalUnitCost,
    String? naturalFreqeuncyType,
    String? livingSpaceArea,
    String? waterUsage,
  }) {
    return Utilities(
      questionID: questionID,
      electrictyBill: electrictyBill ?? this.electrictyBill,
      electrictyUnitCost: electrictyUnitCost ?? this.electrictyUnitCost,
      electrictyFreqeuncyType:
          electrictyFreqeuncyType ?? this.electrictyFreqeuncyType,
      heatingyBill: heatingyBill ?? this.heatingyBill,
      heatingUnitCost: heatingUnitCost ?? this.heatingUnitCost,
      heatingreqeuncyType: heatingreqeuncyType ?? this.heatingreqeuncyType,
      naturalBill: naturalBill ?? this.naturalBill,
      naturalUnitCost: naturalUnitCost ?? this.naturalUnitCost,
      naturalFreqeuncyType: naturalFreqeuncyType ?? this.naturalFreqeuncyType,
      livingSpaceArea: livingSpaceArea ?? this.livingSpaceArea,
      waterUsage: waterUsage ?? this.waterUsage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'questionID':questionID,
      'electrictyBill': electrictyBill,
      'electrictyUnitCost': electrictyUnitCost,
      'ElectrictyfreqeuncyType': electrictyFreqeuncyType,
      'heatingyBill': heatingyBill,
      'heatingUnitCost': heatingUnitCost,
      'heatingreqeuncyType': heatingreqeuncyType,
      'naturalBill': naturalBill,
      'naturalUnitCost': naturalUnitCost,
      'naturalFreqeuncyType': naturalFreqeuncyType,
      'livingSpaceArea': livingSpaceArea,
      'waterUsage': waterUsage,
    };
  }

  factory Utilities.fromMap(Map<String, dynamic> map) {
    return Utilities(
      questionID: map['questionID'],
      electrictyBill: map['electrictyBill']?.toDouble() ?? 0.0,
      electrictyUnitCost: map['electrictyUnitCost'] ?? '',
      electrictyFreqeuncyType: map['ElectrictyfreqeuncyType'] ?? '',
      heatingyBill: map['heatingyBill']?.toDouble() ?? 0.0,
      heatingUnitCost: map['heatingUnitCost'] ?? '',
      heatingreqeuncyType: map['heatingreqeuncyType'] ?? '',
      naturalBill: map['naturalBill']?.toDouble() ?? 0.0,
      naturalUnitCost: map['naturalUnitCost'] ?? '',
      naturalFreqeuncyType: map['naturalFreqeuncyType'] ?? '',
      livingSpaceArea: map['livingSpaceArea']?.toDouble() ?? 0.0,
      waterUsage: map['waterUsage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Utilities.fromJson(String source) =>
      Utilities.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Utilities(electrictyBill: $electrictyBill, electrictyUnitCost: $electrictyUnitCost, ElectrictyfreqeuncyType: $electrictyFreqeuncyType, heatingyBill: $heatingyBill, heatingUnitCost: $heatingUnitCost, heatingreqeuncyType: $heatingreqeuncyType, naturalBill: $naturalBill, naturalUnitCost: $naturalUnitCost, naturalFreqeuncyType: $naturalFreqeuncyType, livingSpaceArea: $livingSpaceArea, waterUsage: $waterUsage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Utilities &&
        other.electrictyBill == electrictyBill &&
        other.electrictyUnitCost == electrictyUnitCost &&
        other.electrictyFreqeuncyType == electrictyFreqeuncyType &&
        other.heatingyBill == heatingyBill &&
        other.heatingUnitCost == heatingUnitCost &&
        other.heatingreqeuncyType == heatingreqeuncyType &&
        other.naturalBill == naturalBill &&
        other.naturalUnitCost == naturalUnitCost &&
        other.naturalFreqeuncyType == naturalFreqeuncyType &&
        other.livingSpaceArea == livingSpaceArea &&
        other.waterUsage == waterUsage;
  }

  @override
  int get hashCode {
    return electrictyBill.hashCode ^
        electrictyUnitCost.hashCode ^
        electrictyFreqeuncyType.hashCode ^
        heatingyBill.hashCode ^
        heatingUnitCost.hashCode ^
        heatingreqeuncyType.hashCode ^
        naturalBill.hashCode ^
        naturalUnitCost.hashCode ^
        naturalFreqeuncyType.hashCode ^
        livingSpaceArea.hashCode ^
        questionID.hashCode ^
        waterUsage.hashCode;
  }
}
