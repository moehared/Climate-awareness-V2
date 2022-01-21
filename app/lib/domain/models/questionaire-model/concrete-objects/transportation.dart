import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/domain/models/questionaire-model/carbon-emission/carbon-emission.dart';
import 'package:hive/hive.dart';

class Transportation extends CarbonEmission {
  static const String CAR_TIP = """ 
  · When possible, walk or ride your bicycle in order to avoid carbon emissions totally. Carpooling and public transportation definitely decrease CO2 emissions by spreading them out over many riders.\n
  · change your driving style. Speeding and unnecessary acceleration increase your carbon footprint and waste gas as well as money.\n
  """;
  static const String PLANE_USAGE_TIP = """ 
    Flights produce greenhouse gases - mainly carbon dioxide (CO2) - from burning fuel. These contribute to global warming when released into the atmosphere. Emissions from flights stay in the atmosphere and will warm it for several centuries Because aircraft emissions are released high in the atmosphere, they have a potent climate impact, triggering chemical reactions and atmospheric effects that heat the planet.\n Here is what you can do.\n
  · Fly only when necessary and stay longer. When flying for work, group meetings together. Take direct flights when possible. Or, skip the flight and use video teleconferencing.\n
  """;
  static const String PUBLIC_USAGE_TIP = """ 
  Individuals can save more than \$9,738 per year by taking public transportation instead of driving. Moreover, this mode can lead to substantial environmental benefits.\n
  Transportation is the largest source of carbon emissions. Communities with strong public transportation can reduce the nation’s carbon emissions by 37 million metric tons yearly.\n
  """;
  final int numberOfVehicle;

  final String totalPublicTransitPerYear;

  final String totalAirTravelPerYear;

  final String publicTransitUnit;

  final String airTravelUnit;

  final List<Vehicle?> vehicle;

  final String questionID;

  final String title;

  final bool isSimple;
  // advance input for both air and public transit  . these are optional and can be null;

  String? bus;

  String? busUnit;

  String? transitRail;

  String? transitRailUnit;

  String? commuterRail;

  String? commuterRailUnit;

  String? interCityRail;

  String? interCityRailUnit;

  final String imageAsset;

  String? shortTravelByAir;

  String? numberOfShortTravelByAir;

  String? mediumTravelByAir;

  String? numberOfMediumTravelByAir;

  String? longTravelByAir;
  final String desc;
  String? numberOfLongTravelByAir;
  String findById() {
    return questionID;
  }

  String? extendedTravelByAir;
  final String learn;
  String? numberOfExtendedTravelByAir;
  Transportation({
    this.desc = CAR_TIP + '\n' + PLANE_USAGE_TIP + '\n' + PUBLIC_USAGE_TIP,
    this.title = 'Transportation',
    this.imageAsset = 'images/trans.png',
    this.learn = 'https://ourworldindata.org/co2-emissions-from-transport',
    required this.numberOfVehicle,
    required this.totalPublicTransitPerYear,
    required this.totalAirTravelPerYear,
    required this.publicTransitUnit,
    required this.airTravelUnit,
    required this.vehicle,
    required this.questionID,
    required this.isSimple,
    this.bus,
    this.busUnit,
    this.transitRail,
    this.transitRailUnit,
    this.commuterRail,
    this.commuterRailUnit,
    this.interCityRail,
    this.interCityRailUnit,
    this.shortTravelByAir,
    this.numberOfShortTravelByAir,
    this.mediumTravelByAir,
    this.numberOfMediumTravelByAir,
    this.longTravelByAir,
    this.numberOfLongTravelByAir,
    this.extendedTravelByAir,
    this.numberOfExtendedTravelByAir,
  });

  Transportation copyWith({
    int? numberOfVehicle,
    String? totalPublicTransitPerYear,
    String? totalAirTravelPerYear,
    String? publicTransitUnit,
    String? airTravelUnit,
    List<Vehicle?>? vehicle,
    String? questionId,
    bool? isSimple,
    String? bus,
    String? busUnit,
    String? transitRail,
    String? transitRailUnit,
    String? commuterRail,
    String? commuterRailUnit,
    String? interCityRail,
    String? interCityRailUnit,
    String? shortTravelByAir,
    String? numberOfShortTravelByAir,
    String? mediumTravelByAir,
    String? numberOfMediumTravelByAir,
    String? longTravelByAir,
    String? numberOfLongTravelByAir,
    String? extendedTravelByAir,
    String? numberOfExtendedTravelByAir,
  }) {
    return Transportation(
      numberOfVehicle: numberOfVehicle ?? this.numberOfVehicle,
      totalPublicTransitPerYear:
          totalPublicTransitPerYear ?? this.totalPublicTransitPerYear,
      totalAirTravelPerYear:
          totalAirTravelPerYear ?? this.totalAirTravelPerYear,
      publicTransitUnit: publicTransitUnit ?? this.publicTransitUnit,
      airTravelUnit: airTravelUnit ?? this.airTravelUnit,
      vehicle: vehicle ?? this.vehicle,
      questionID: questionId ?? this.questionID,
      isSimple: isSimple ?? this.isSimple,
      bus: bus ?? this.bus,
      busUnit: busUnit ?? this.busUnit,
      transitRail: transitRail ?? this.transitRail,
      transitRailUnit: transitRailUnit ?? this.transitRailUnit,
      commuterRail: commuterRail ?? this.commuterRail,
      commuterRailUnit: commuterRailUnit ?? this.commuterRailUnit,
      interCityRail: interCityRail ?? this.interCityRail,
      interCityRailUnit: interCityRailUnit ?? this.interCityRailUnit,
      shortTravelByAir: shortTravelByAir ?? this.shortTravelByAir,
      numberOfShortTravelByAir:
          numberOfShortTravelByAir ?? this.numberOfShortTravelByAir,
      mediumTravelByAir: mediumTravelByAir ?? this.mediumTravelByAir,
      numberOfMediumTravelByAir:
          numberOfMediumTravelByAir ?? this.numberOfMediumTravelByAir,
      longTravelByAir: longTravelByAir ?? this.longTravelByAir,
      numberOfLongTravelByAir:
          numberOfLongTravelByAir ?? this.numberOfLongTravelByAir,
      extendedTravelByAir: extendedTravelByAir ?? this.extendedTravelByAir,
      numberOfExtendedTravelByAir:
          numberOfExtendedTravelByAir ?? this.numberOfExtendedTravelByAir,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'numberOfVehicle': numberOfVehicle,
      'totalPublicTransitPerYear': totalPublicTransitPerYear,
      'totalAirTravelPerYear': totalAirTravelPerYear,
      'publicTransitUnit': publicTransitUnit,
      'airTravelUnit': airTravelUnit,
      'vehicle': vehicle.map((x) => x?.toMap()).toList(),
      'questionId': questionID,
      'isSimple': isSimple,
      'bus': bus,
      'busUnit': busUnit,
      'transitRail': transitRail,
      'transitRailUnit': transitRailUnit,
      'commuterRail': commuterRail,
      'commuterRailUnit': commuterRailUnit,
      'interCityRail': interCityRail,
      'interCityRailUnit': interCityRailUnit,
      'shortTravelByAir': shortTravelByAir,
      'numberOfShortTravelByAir': numberOfShortTravelByAir,
      'mediumTravelByAir': mediumTravelByAir,
      'numberOfMediumTravelByAir': numberOfMediumTravelByAir,
      'longTravelByAir': longTravelByAir,
      'numberOfLongTravelByAir': numberOfLongTravelByAir,
      'extendedTravelByAir': extendedTravelByAir,
      'numberOfExtendedTravelByAir': numberOfExtendedTravelByAir,
    };
  }

  factory Transportation.fromMap(Map<String, dynamic> map) {
    return Transportation(
      numberOfVehicle: map['numberOfVehicle']?.toInt() ?? 0,
      totalPublicTransitPerYear: map['totalPublicTransitPerYear'] ?? '',
      totalAirTravelPerYear: map['totalAirTravelPerYear'] ?? '',
      publicTransitUnit: map['publicTransitUnit'] ?? '',
      airTravelUnit: map['airTravelUnit'] ?? '',
      vehicle:
          List<Vehicle?>.from(map['vehicle']?.map((x) => Vehicle.fromMap(x))),
      questionID: map['questionId'] ?? '',
      isSimple: map['isSimple'] ?? false,
      bus: map['bus'],
      busUnit: map['busUnit'],
      transitRail: map['transitRail'],
      transitRailUnit: map['transitRailUnit'],
      commuterRail: map['commuterRail'],
      commuterRailUnit: map['commuterRailUnit'],
      interCityRail: map['interCityRail'],
      interCityRailUnit: map['interCityRailUnit'],
      shortTravelByAir: map['shortTravelByAir'],
      numberOfShortTravelByAir: map['numberOfShortTravelByAir'],
      mediumTravelByAir: map['mediumTravelByAir'],
      numberOfMediumTravelByAir: map['numberOfMediumTravelByAir'],
      longTravelByAir: map['longTravelByAir'],
      numberOfLongTravelByAir: map['numberOfLongTravelByAir'],
      extendedTravelByAir: map['extendedTravelByAir'],
      numberOfExtendedTravelByAir: map['numberOfExtendedTravelByAir'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Transportation.fromJson(String source) =>
      Transportation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Transportation(numberOfVehicle: $numberOfVehicle, totalPublicTransitPerYear: $totalPublicTransitPerYear, totalAirTravelPerYear: $totalAirTravelPerYear, publicTransitUnit: $publicTransitUnit, airTravelUnit: $airTravelUnit, vehicle: $vehicle, questionId: $questionID, isSimple: $isSimple, bus: $bus, busUnit: $busUnit, transitRail: $transitRail, transitRailUnit: $transitRailUnit, commuterRail: $commuterRail, commuterRailUnit: $commuterRailUnit, interCityRail: $interCityRail, interCityRailUnit: $interCityRailUnit, shortTravelByAir: $shortTravelByAir, numberOfShortTravelByAir: $numberOfShortTravelByAir, mediumTravelByAir: $mediumTravelByAir, numberOfMediumTravelByAir: $numberOfMediumTravelByAir, longTravelByAir: $longTravelByAir, numberOfLongTravelByAir: $numberOfLongTravelByAir, extendedTravelByAir: $extendedTravelByAir, numberOfExtendedTravelByAir: $numberOfExtendedTravelByAir)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transportation &&
        other.numberOfVehicle == numberOfVehicle &&
        other.totalPublicTransitPerYear == totalPublicTransitPerYear &&
        other.totalAirTravelPerYear == totalAirTravelPerYear &&
        other.publicTransitUnit == publicTransitUnit &&
        other.airTravelUnit == airTravelUnit &&
        listEquals(other.vehicle, vehicle) &&
        other.questionID == questionID &&
        other.isSimple == isSimple &&
        other.bus == bus &&
        other.busUnit == busUnit &&
        other.transitRail == transitRail &&
        other.transitRailUnit == transitRailUnit &&
        other.commuterRail == commuterRail &&
        other.commuterRailUnit == commuterRailUnit &&
        other.interCityRail == interCityRail &&
        other.interCityRailUnit == interCityRailUnit &&
        other.shortTravelByAir == shortTravelByAir &&
        other.numberOfShortTravelByAir == numberOfShortTravelByAir &&
        other.mediumTravelByAir == mediumTravelByAir &&
        other.numberOfMediumTravelByAir == numberOfMediumTravelByAir &&
        other.longTravelByAir == longTravelByAir &&
        other.numberOfLongTravelByAir == numberOfLongTravelByAir &&
        other.extendedTravelByAir == extendedTravelByAir &&
        other.numberOfExtendedTravelByAir == numberOfExtendedTravelByAir;
  }

  @override
  int get hashCode {
    return numberOfVehicle.hashCode ^
        totalPublicTransitPerYear.hashCode ^
        totalAirTravelPerYear.hashCode ^
        publicTransitUnit.hashCode ^
        airTravelUnit.hashCode ^
        vehicle.hashCode ^
        questionID.hashCode ^
        isSimple.hashCode ^
        bus.hashCode ^
        busUnit.hashCode ^
        transitRail.hashCode ^
        transitRailUnit.hashCode ^
        commuterRail.hashCode ^
        commuterRailUnit.hashCode ^
        interCityRail.hashCode ^
        interCityRailUnit.hashCode ^
        shortTravelByAir.hashCode ^
        numberOfShortTravelByAir.hashCode ^
        mediumTravelByAir.hashCode ^
        numberOfMediumTravelByAir.hashCode ^
        longTravelByAir.hashCode ^
        numberOfLongTravelByAir.hashCode ^
        extendedTravelByAir.hashCode ^
        numberOfExtendedTravelByAir.hashCode;
  }
}

@HiveType(typeId: 6)
class Vehicle {
  @HiveField(0)
  final int totalDrivenPerYear;
  @HiveField(1)
  final String fuelType;
  @HiveField(2)
  final String unitType;
  @HiveField(3)
  final String mpgValue;
  Vehicle({
    required this.totalDrivenPerYear,
    required this.fuelType,
    required this.unitType,
    required this.mpgValue,
  });

  Vehicle copyWith({
    int? totalDrivenPerYear,
    String? fuelType,
    String? unitType,
    String? mpgValue,
  }) {
    return Vehicle(
      totalDrivenPerYear: totalDrivenPerYear ?? this.totalDrivenPerYear,
      fuelType: fuelType ?? this.fuelType,
      unitType: unitType ?? this.unitType,
      mpgValue: mpgValue ?? this.mpgValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalDrivenPerYear': totalDrivenPerYear,
      'fuelType': fuelType,
      'unitType': unitType,
      'mpgValue': mpgValue,
    };
  }

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      totalDrivenPerYear: map['totalDrivenPerYear']?.toInt() ?? 0,
      fuelType: map['fuelType'] ?? '',
      unitType: map['unitType'] ?? '',
      mpgValue: map['mpgValue'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Vehicle.fromJson(String source) =>
      Vehicle.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Vehicle(totalDrivenPerYear: $totalDrivenPerYear, fuelType: $fuelType, unitType: $unitType, mpgValue: $mpgValue)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Vehicle &&
        other.totalDrivenPerYear == totalDrivenPerYear &&
        other.fuelType == fuelType &&
        other.unitType == unitType &&
        other.mpgValue == mpgValue;
  }

  @override
  int get hashCode {
    return totalDrivenPerYear.hashCode ^
        fuelType.hashCode ^
        unitType.hashCode ^
        mpgValue.hashCode;
  }
}
