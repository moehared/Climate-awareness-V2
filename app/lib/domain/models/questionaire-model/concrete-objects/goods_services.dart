import 'dart:convert';

import 'package:app/domain/models/questionaire-model/service-emission/service-emission.dart';

class GoodsServices extends ServiceEmission {
  final double totalGoodsSpent;
  final String questionId;
  final double totalServiceSpent;
  final String furnitureAndAppliance;
  final String clothing;
  final String entertaining;
  final String paperOfficeReading;
  final String personalCare;
  final String autoParts;
  final String medical;
  final String healthCare;
  final String informationAndCommunication;
  final String organizationAndCharity;
  final String vehicleService;
  final String houseHoldMaintenanceAndRepair;
  final String otherService;
  GoodsServices({
    required this.totalGoodsSpent,
    required this.questionId,
    required this.totalServiceSpent,
    required this.furnitureAndAppliance,
    required this.clothing,
    required this.entertaining,
    required this.paperOfficeReading,
    required this.personalCare,
    required this.autoParts,
    required this.medical,
    required this.healthCare,
    required this.informationAndCommunication,
    required this.organizationAndCharity,
    required this.vehicleService,
    required this.houseHoldMaintenanceAndRepair,
    required this.otherService,
  });
 

  GoodsServices copyWith({
    double? totalGoodsSpent,
    String? questionId,
    double? totalServiceSpent,
    String? furnitureAndAppliance,
    String? clothing,
    String? entertaining,
    String? paperOfficeReading,
    String? personalCare,
    String? autoParts,
    String? medical,
    String? healthCare,
    String? informationAndCommunication,
    String? organizationAndCharity,
    String? vehicleService,
    String? houseHoldMaintenanceAndRepair,
    String? otherService,
  }) {
    return GoodsServices(
      totalGoodsSpent: totalGoodsSpent ?? this.totalGoodsSpent,
      questionId: questionId ?? this.questionId,
      totalServiceSpent: totalServiceSpent ?? this.totalServiceSpent,
      furnitureAndAppliance: furnitureAndAppliance ?? this.furnitureAndAppliance,
      clothing: clothing ?? this.clothing,
      entertaining: entertaining ?? this.entertaining,
      paperOfficeReading: paperOfficeReading ?? this.paperOfficeReading,
      personalCare: personalCare ?? this.personalCare,
      autoParts: autoParts ?? this.autoParts,
      medical: medical ?? this.medical,
      healthCare: healthCare ?? this.healthCare,
      informationAndCommunication: informationAndCommunication ?? this.informationAndCommunication,
      organizationAndCharity: organizationAndCharity ?? this.organizationAndCharity,
      vehicleService: vehicleService ?? this.vehicleService,
      houseHoldMaintenanceAndRepair: houseHoldMaintenanceAndRepair ?? this.houseHoldMaintenanceAndRepair,
      otherService: otherService ?? this.otherService,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalGoodsSpent': totalGoodsSpent,
      'questionId': questionId,
      'totalServiceSpent': totalServiceSpent,
      'furnitureAndAppliance': furnitureAndAppliance,
      'clothing': clothing,
      'entertaining': entertaining,
      'paperOfficeReading': paperOfficeReading,
      'personalCare': personalCare,
      'autoParts': autoParts,
      'medical': medical,
      'healthCare': healthCare,
      'informationAndCommunication': informationAndCommunication,
      'organizationAndCharity': organizationAndCharity,
      'vehicleService': vehicleService,
      'houseHoldMaintenanceAndRepair': houseHoldMaintenanceAndRepair,
      'otherService': otherService,
    };
  }

  factory GoodsServices.fromMap(Map<String, dynamic> map) {
    return GoodsServices(
      totalGoodsSpent: map['totalGoodsSpent']?.toDouble() ?? 0.0,
      questionId: map['questionId'] ?? '',
      totalServiceSpent: map['totalServiceSpent']?.toDouble() ?? 0.0,
      furnitureAndAppliance: map['furnitureAndAppliance'] ?? '',
      clothing: map['clothing'] ?? '',
      entertaining: map['entertaining'] ?? '',
      paperOfficeReading: map['paperOfficeReading'] ?? '',
      personalCare: map['personalCare'] ?? '',
      autoParts: map['autoParts'] ?? '',
      medical: map['medical'] ?? '',
      healthCare: map['healthCare'] ?? '',
      informationAndCommunication: map['informationAndCommunication'] ?? '',
      organizationAndCharity: map['organizationAndCharity'] ?? '',
      vehicleService: map['vehicleService'] ?? '',
      houseHoldMaintenanceAndRepair: map['houseHoldMaintenanceAndRepair'] ?? '',
      otherService: map['otherService'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GoodsServices.fromJson(String source) => GoodsServices.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GoodsServices(totalGoodsSpent: $totalGoodsSpent, questionId: $questionId, totalServiceSpent: $totalServiceSpent, furnitureAndAppliance: $furnitureAndAppliance, clothing: $clothing, entertaining: $entertaining, paperOfficeReading: $paperOfficeReading, personalCare: $personalCare, autoParts: $autoParts, medical: $medical, healthCare: $healthCare, informationAndCommunication: $informationAndCommunication, organizationAndCharity: $organizationAndCharity, vehicleService: $vehicleService, houseHoldMaintenanceAndRepair: $houseHoldMaintenanceAndRepair, otherService: $otherService)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GoodsServices &&
      other.totalGoodsSpent == totalGoodsSpent &&
      other.questionId == questionId &&
      other.totalServiceSpent == totalServiceSpent &&
      other.furnitureAndAppliance == furnitureAndAppliance &&
      other.clothing == clothing &&
      other.entertaining == entertaining &&
      other.paperOfficeReading == paperOfficeReading &&
      other.personalCare == personalCare &&
      other.autoParts == autoParts &&
      other.medical == medical &&
      other.healthCare == healthCare &&
      other.informationAndCommunication == informationAndCommunication &&
      other.organizationAndCharity == organizationAndCharity &&
      other.vehicleService == vehicleService &&
      other.houseHoldMaintenanceAndRepair == houseHoldMaintenanceAndRepair &&
      other.otherService == otherService;
  }

  @override
  int get hashCode {
    return totalGoodsSpent.hashCode ^
      questionId.hashCode ^
      totalServiceSpent.hashCode ^
      furnitureAndAppliance.hashCode ^
      clothing.hashCode ^
      entertaining.hashCode ^
      paperOfficeReading.hashCode ^
      personalCare.hashCode ^
      autoParts.hashCode ^
      medical.hashCode ^
      healthCare.hashCode ^
      informationAndCommunication.hashCode ^
      organizationAndCharity.hashCode ^
      vehicleService.hashCode ^
      houseHoldMaintenanceAndRepair.hashCode ^
      otherService.hashCode;
  }
}
