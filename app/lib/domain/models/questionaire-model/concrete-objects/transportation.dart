import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/domain/models/questionaire-model/carbon-emission/carbon-emission.dart';

class Transportation extends CarbonEmission {
  final int numberOfVehicle;
  final String totalPublicTransitPerYear;
  final String totalAirTravelPerYear;
  final String publicTransitUnit;
  final String airTravelUnit;
  final List<Vehicle>? vehicle;
  final String questionId;
  // advance input for both air and public transit  . these are optional and can be null;

  String? bus;
  String? busUnit;
  String? transitRail;
  String? transitRailUnit;
  String? commuterRail;
  String? commuterRailUnit;
  String? interCityRail;
  String? interCityRailUnit;

  String? shortTravelByAir;
  String? numberOfShortTravelByAir;

  String? mediumTravelByAir;
  String? numberOfMediumTravelByAir;

  String? longTravelByAir;
  String? numberOfLongTravelByAir;

  String? extendedTravelByAir;
  String? numberOfExtendedTravelByAir;
  Transportation({
    required this.questionId,
    required this.numberOfVehicle,
    required this.totalPublicTransitPerYear,
    required this.totalAirTravelPerYear,
    required this.publicTransitUnit,
    required this.airTravelUnit,
    this.vehicle,
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
    List<Vehicle>? vehicle,
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
      questionId: this.questionId,
      numberOfVehicle: numberOfVehicle ?? this.numberOfVehicle,
      totalPublicTransitPerYear:
          totalPublicTransitPerYear ?? this.totalPublicTransitPerYear,
      totalAirTravelPerYear:
          totalAirTravelPerYear ?? this.totalAirTravelPerYear,
      publicTransitUnit: publicTransitUnit ?? this.publicTransitUnit,
      airTravelUnit: airTravelUnit ?? this.airTravelUnit,
      vehicle: vehicle ?? this.vehicle,
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

  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'numberOfVehicle': numberOfVehicle,
      'totalPublicTransitPerYear': totalPublicTransitPerYear,
      'totalAirTravelPerYear': totalAirTravelPerYear,
      'publicTransitUnit': publicTransitUnit,
      'airTravelUnit': airTravelUnit,
      'vehicle': vehicle != null ? vehicle!.map((x) => x.toMap()).toList() : [],
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
      questionId: map['questionId'] ?? "Q2",
      numberOfVehicle: map['numberOfVehicle']?.toInt() ?? 0,
      totalPublicTransitPerYear: map['totalPublicTransitPerYear']?.toInt() ?? 0,
      totalAirTravelPerYear: map['totalAirTravelPerYear']?.toInt() ?? 0,
      publicTransitUnit: map['publicTransitUnit'] ?? '',
      airTravelUnit: map['airTravelUnit'] ?? '',
      vehicle: map['vehicle'] != null
          ? List<Vehicle>.from(map['vehicle']?.map((x) => Vehicle.fromMap(x)))
          : null,
      bus: map['bus']?.toInt(),
      busUnit: map['busUnit'],
      transitRail: map['transitRail']?.toInt(),
      transitRailUnit: map['transitRailUnit'],
      commuterRail: map['commuterRail']?.toInt(),
      commuterRailUnit: map['commuterRailUnit'],
      interCityRail: map['interCityRail']?.toInt(),
      interCityRailUnit: map['interCityRailUnit'],
      shortTravelByAir: map['shortTravelByAir']?.toInt(),
      numberOfShortTravelByAir: map['numberOfShortTravelByAir'],
      mediumTravelByAir: map['mediumTravelByAir']?.toInt(),
      numberOfMediumTravelByAir: map['numberOfMediumTravelByAir'],
      longTravelByAir: map['longTravelByAir']?.toInt(),
      numberOfLongTravelByAir: map['numberOfLongTravelByAir'],
      extendedTravelByAir: map['extendedTravelByAir']?.toInt(),
      numberOfExtendedTravelByAir: map['numberOfExtendedTravelByAir'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Transportation.fromJson(String source) =>
      Transportation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Transportation(numberOfVehicle: $numberOfVehicle, totalPublicTransitPerYear: $totalPublicTransitPerYear, totalAirTravelPerYear: $totalAirTravelPerYear, publicTransitUnit: $publicTransitUnit, airTravelUnit: $airTravelUnit, vehicle: $vehicle, bus: $bus, busUnit: $busUnit, transitRail: $transitRail, transitRailUnit: $transitRailUnit, commuterRail: $commuterRail, commuterRailUnit: $commuterRailUnit, interCityRail: $interCityRail, interCityRailUnit: $interCityRailUnit, shortTravelByAir: $shortTravelByAir, numberOfShortTravelByAir: $numberOfShortTravelByAir, mediumTravelByAir: $mediumTravelByAir, numberOfMediumTravelByAir: $numberOfMediumTravelByAir, longTravelByAir: $longTravelByAir, numberOfLongTravelByAir: $numberOfLongTravelByAir, extendedTravelByAir: $extendedTravelByAir, numberOfExtendedTravelByAir: $numberOfExtendedTravelByAir)';
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

class Vehicle {
  final int totalDrivenPerYear;
  final String fuelType;
  final String unitType;
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
