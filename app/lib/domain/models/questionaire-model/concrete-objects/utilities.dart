import 'dart:convert';

import 'package:app/domain/models/questionaire-model/carbon-emission/carbon-emission.dart';
import 'package:app/domain/models/questionaire-model/category.dart';

class Utilities extends CarbonEmission {
  static const String WATER_TIP =
      """· It takes lots of energy to pump, treat, and heat water, so saving water reduces greenhouse gas emissions. Three percent of the nation's energy is used to pump and treat water, so conserving water conserves energy that reduces greenhouse gas pollution.\n · Reduce the amount of waste you generate and the water you consume whenever possible. Here are some tips that can help you take action.\n\n · Pursue simple water-saving actions, such as not letting the water run while shaving or brushing teeth and try to take shorter showers.\n · Check faucets and pipes for leaks. Even a small drip can waste 50 or more gallons of water a day.\n ·  Don't let the faucet run while you clean vegetables or doing dishes.\n""";

  static const String ENERGY_TIP = """ 
  By becoming more energy-efficient, you not only pollute less but save utilities bill too. Here are following tips you can consider taking action. Together they can really add up.\n
  · Turn off lights you’re not using and when you leave the room. Replace incandescent light bulbs with compact fluorescent or LED ones.\n
  · Adjust your thermostat. Don’t set it too high or low. Install a programmable model to turn off the heat/air conditioning when you’re not home.\n
  · Swap your gas stove for an electric stove, which will also lower indoor air pollution.\n
  · Wash clothes in cold water. Hang-dry your clothes when you can and use dryer balls when you can’t.\n
  """;
  final String electrictyBill;

  final String electrictyUnitCost;

  final String electrictyFreqeuncyType;

  final String questionID;

  final String title;

  final String dollarPerElectricty;

  final String kwhPerElectricity;

  final int naturalGasType;

  final int dollarPerYearNaturalGas;

  final int thermsPerYearNaturalGas;

  final String imageAsset;

  final int heatingOilType;

  final int dollarHeatingOil;

  final int dollarGallonHeatingOil;

  final int electricityType;

  final String naturalBill;

  final String naturalUnitCost;

  final String naturalFreqeuncyType;
  final String desc;
  final String livingSpaceArea;
  final String learn;
  final String waterUsage;
  Utilities({
    this.title = 'Electricity',
    this.imageAsset = 'images/energy.jpg',
    this.desc = WATER_TIP + '\n' + ENERGY_TIP,
    this.learn = 'https://energysavingtrust.org.uk/advice/home-appliances/',
    required this.electrictyBill,
    required this.electrictyUnitCost,
    required this.electrictyFreqeuncyType,
    required this.questionID,
    required this.dollarPerElectricty,
    required this.kwhPerElectricity,
    required this.naturalGasType,
    required this.dollarPerYearNaturalGas,
    required this.thermsPerYearNaturalGas,
    required this.heatingOilType,
    required this.dollarHeatingOil,
    required this.dollarGallonHeatingOil,
    required this.electricityType,
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
    String? questionID,
    String? dollarPerElectricty,
    String? kwhPerElectricity,
    int? naturalGasType,
    int? dollarPerYearNaturalGas,
    int? thermsPerYearNaturalGas,
    int? heatingOilType,
    int? dollarHeatingOil,
    int? gallonHeatingOil,
    int? electricityType,
    String? naturalBill,
    String? naturalUnitCost,
    String? naturalFreqeuncyType,
    String? livingSpaceArea,
    String? waterUsage,
  }) {
    return Utilities(
      electrictyBill: electrictyBill ?? this.electrictyBill,
      electrictyUnitCost: electrictyUnitCost ?? this.electrictyUnitCost,
      electrictyFreqeuncyType:
          electrictyFreqeuncyType ?? this.electrictyFreqeuncyType,
      questionID: questionID ?? this.questionID,
      dollarPerElectricty: dollarPerElectricty ?? this.dollarPerElectricty,
      kwhPerElectricity: kwhPerElectricity ?? this.kwhPerElectricity,
      naturalGasType: naturalGasType ?? this.naturalGasType,
      dollarPerYearNaturalGas:
          dollarPerYearNaturalGas ?? this.dollarPerYearNaturalGas,
      thermsPerYearNaturalGas:
          thermsPerYearNaturalGas ?? this.thermsPerYearNaturalGas,
      heatingOilType: heatingOilType ?? this.heatingOilType,
      dollarHeatingOil: dollarHeatingOil ?? this.dollarHeatingOil,
      dollarGallonHeatingOil: gallonHeatingOil ?? this.dollarGallonHeatingOil,
      electricityType: electricityType ?? this.electricityType,
      naturalBill: naturalBill ?? this.naturalBill,
      naturalUnitCost: naturalUnitCost ?? this.naturalUnitCost,
      naturalFreqeuncyType: naturalFreqeuncyType ?? this.naturalFreqeuncyType,
      livingSpaceArea: livingSpaceArea ?? this.livingSpaceArea,
      waterUsage: waterUsage ?? this.waterUsage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'electrictyBill': electrictyBill,
      'electrictyUnitCost': electrictyUnitCost,
      'electrictyFreqeuncyType': electrictyFreqeuncyType,
      'questionID': questionID,
      'dollarPerElectricty': dollarPerElectricty,
      'kwhPerElectricity': kwhPerElectricity,
      'naturalGasType': naturalGasType,
      'dollarPerYearNaturalGas': dollarPerYearNaturalGas,
      'thermsPerYearNaturalGas': thermsPerYearNaturalGas,
      'heatingOilType': heatingOilType,
      'dollarHeatingOil': dollarHeatingOil,
      'gallonHeatingOil': dollarGallonHeatingOil,
      'electricityType': electricityType,
      'naturalBill': naturalBill,
      'naturalUnitCost': naturalUnitCost,
      'naturalFreqeuncyType': naturalFreqeuncyType,
      'livingSpaceArea': livingSpaceArea,
      'waterUsage': waterUsage,
    };
  }

  factory Utilities.fromMap(Map<String, dynamic> map) {
    return Utilities(
      electrictyBill: map['electrictyBill'] ?? '',
      electrictyUnitCost: map['electrictyUnitCost'] ?? '',
      electrictyFreqeuncyType: map['electrictyFreqeuncyType'] ?? '',
      questionID: map['questionID'] ?? '',
      dollarPerElectricty: map['dollarPerElectricty'] ?? '',
      kwhPerElectricity: map['kwhPerElectricity'] ?? '',
      naturalGasType: map['naturalGasType']?.toInt() ?? 0,
      dollarPerYearNaturalGas: map['dollarPerYearNaturalGas']?.toInt() ?? 0,
      thermsPerYearNaturalGas: map['thermsPerYearNaturalGas']?.toInt() ?? 0,
      heatingOilType: map['heatingOilType']?.toInt() ?? 0,
      dollarHeatingOil: map['dollarHeatingOil']?.toInt() ?? 0,
      dollarGallonHeatingOil: map['gallonHeatingOil']?.toInt() ?? 0,
      electricityType: map['electricityType']?.toInt() ?? 0,
      naturalBill: map['naturalBill'] ?? '',
      naturalUnitCost: map['naturalUnitCost'] ?? '',
      naturalFreqeuncyType: map['naturalFreqeuncyType'] ?? '',
      livingSpaceArea: map['livingSpaceArea'] ?? '',
      waterUsage: map['waterUsage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Utilities.fromJson(String source) =>
      Utilities.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Utilities(electrictyBill: $electrictyBill, electrictyUnitCost: $electrictyUnitCost, electrictyFreqeuncyType: $electrictyFreqeuncyType, questionID: $questionID, dollarPerElectricty: $dollarPerElectricty, kwhPerElectricity: $kwhPerElectricity, naturalGasType: $naturalGasType, dollarPerYearNaturalGas: $dollarPerYearNaturalGas, thermsPerYearNaturalGas: $thermsPerYearNaturalGas, heatingOilType: $heatingOilType, dollarHeatingOil: $dollarHeatingOil, gallonHeatingOil: $dollarGallonHeatingOil, electricityType: $electricityType, naturalBill: $naturalBill, naturalUnitCost: $naturalUnitCost, naturalFreqeuncyType: $naturalFreqeuncyType, livingSpaceArea: $livingSpaceArea, waterUsage: $waterUsage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Utilities &&
        other.electrictyBill == electrictyBill &&
        other.electrictyUnitCost == electrictyUnitCost &&
        other.electrictyFreqeuncyType == electrictyFreqeuncyType &&
        other.questionID == questionID &&
        other.dollarPerElectricty == dollarPerElectricty &&
        other.kwhPerElectricity == kwhPerElectricity &&
        other.naturalGasType == naturalGasType &&
        other.dollarPerYearNaturalGas == dollarPerYearNaturalGas &&
        other.thermsPerYearNaturalGas == thermsPerYearNaturalGas &&
        other.heatingOilType == heatingOilType &&
        other.dollarHeatingOil == dollarHeatingOil &&
        other.dollarGallonHeatingOil == dollarGallonHeatingOil &&
        other.electricityType == electricityType &&
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
        questionID.hashCode ^
        dollarPerElectricty.hashCode ^
        kwhPerElectricity.hashCode ^
        naturalGasType.hashCode ^
        dollarPerYearNaturalGas.hashCode ^
        thermsPerYearNaturalGas.hashCode ^
        heatingOilType.hashCode ^
        dollarHeatingOil.hashCode ^
        dollarGallonHeatingOil.hashCode ^
        electricityType.hashCode ^
        naturalBill.hashCode ^
        naturalUnitCost.hashCode ^
        naturalFreqeuncyType.hashCode ^
        livingSpaceArea.hashCode ^
        waterUsage.hashCode;
  }

  @override
  String findById() {
    return questionID;
  }
}
