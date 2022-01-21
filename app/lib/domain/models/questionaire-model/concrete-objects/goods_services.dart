import 'dart:convert';

import 'package:app/domain/models/questionaire-model/service-emission/service-emission.dart';

class GoodsServices extends ServiceEmission {

   static const String GOODS_TIP = """ 
  Every product we buy has a carbon footprint: the energy used in making that product will almost certainly have caused some carbon emissions. And depending on the product, the process of manufacture can also cause damaging carbon impacts.\n · One way of reducing emissions from products of all types within the home is to reduce the amount you consume, re-use wherever possible and recycle when you no longer need something.\n · Make energy efficiency a primary consideration when choosing a new furnace, air conditioning unit, dishwasher, or refrigerator. Products bearing the ENERGY STAR label are recognized for having superior efficiency.\n
  """;
  final double totalGoodsSpent;

  final String questionID;

  final double totalServiceSpent;

  final String furnitureAndAppliance;

  final String clothing;

  final String entertaining;

  final String paperOfficeReading;

  final String personalCare;

  final String personalFinance;

  final String autoParts;

  final String medical;

  final String healthCare;

  final String informationAndCommunication;

  final String organizationAndCharity;

  final String vehicleService;

  final String houseHoldMaintenanceAndRepair;

  final String otherService;

  final bool? isSimple;

  final String title;

  final String imageAsset;
  final String learn;
  final String desc;
  GoodsServices({
    this.title = 'Goods And Services',
    this.imageAsset = 'chart-data-icon/services.png',
    this.desc = GOODS_TIP,
    this.learn =
        'https://newrepublic.com/article/154147/climate-change-symptom-consumer-culture-disease',
    required this.totalGoodsSpent,
    required this.questionID,
    required this.totalServiceSpent,
    required this.furnitureAndAppliance,
    required this.clothing,
    required this.entertaining,
    required this.paperOfficeReading,
    required this.personalCare,
    required this.personalFinance,
    required this.autoParts,
    required this.medical,
    required this.healthCare,
    required this.informationAndCommunication,
    required this.organizationAndCharity,
    required this.vehicleService,
    required this.houseHoldMaintenanceAndRepair,
    required this.otherService,
    this.isSimple,
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
    String? personalFinance,
    String? autoParts,
    String? medical,
    String? healthCare,
    String? informationAndCommunication,
    String? organizationAndCharity,
    String? vehicleService,
    String? houseHoldMaintenanceAndRepair,
    String? otherService,
    bool? isSimple,
  }) {
    return GoodsServices(
      totalGoodsSpent: totalGoodsSpent ?? this.totalGoodsSpent,
      questionID: questionId ?? this.questionID,
      totalServiceSpent: totalServiceSpent ?? this.totalServiceSpent,
      furnitureAndAppliance:
          furnitureAndAppliance ?? this.furnitureAndAppliance,
      clothing: clothing ?? this.clothing,
      entertaining: entertaining ?? this.entertaining,
      paperOfficeReading: paperOfficeReading ?? this.paperOfficeReading,
      personalCare: personalCare ?? this.personalCare,
      personalFinance: personalFinance ?? this.personalFinance,
      autoParts: autoParts ?? this.autoParts,
      medical: medical ?? this.medical,
      healthCare: healthCare ?? this.healthCare,
      informationAndCommunication:
          informationAndCommunication ?? this.informationAndCommunication,
      organizationAndCharity:
          organizationAndCharity ?? this.organizationAndCharity,
      vehicleService: vehicleService ?? this.vehicleService,
      houseHoldMaintenanceAndRepair:
          houseHoldMaintenanceAndRepair ?? this.houseHoldMaintenanceAndRepair,
      otherService: otherService ?? this.otherService,
      isSimple: isSimple ?? this.isSimple,
    );
  }

  String findById() {
    return questionID;
  }

  Map<String, dynamic> toMap() {
    return {
      'totalGoodsSpent': totalGoodsSpent,
      'questionId': questionID,
      'totalServiceSpent': totalServiceSpent,
      'furnitureAndAppliance': furnitureAndAppliance,
      'clothing': clothing,
      'entertaining': entertaining,
      'paperOfficeReading': paperOfficeReading,
      'personalCare': personalCare,
      'personalFinance': personalFinance,
      'autoParts': autoParts,
      'medical': medical,
      'healthCare': healthCare,
      'informationAndCommunication': informationAndCommunication,
      'organizationAndCharity': organizationAndCharity,
      'vehicleService': vehicleService,
      'houseHoldMaintenanceAndRepair': houseHoldMaintenanceAndRepair,
      'otherService': otherService,
      'isSimple': isSimple,
    };
  }

  factory GoodsServices.fromMap(Map<String, dynamic> map) {
    return GoodsServices(
      totalGoodsSpent: map['totalGoodsSpent']?.toDouble() ?? 0.0,
      questionID: map['questionId'] ?? '',
      totalServiceSpent: map['totalServiceSpent']?.toDouble() ?? 0.0,
      furnitureAndAppliance: map['furnitureAndAppliance'] ?? '',
      clothing: map['clothing'] ?? '',
      entertaining: map['entertaining'] ?? '',
      paperOfficeReading: map['paperOfficeReading'] ?? '',
      personalCare: map['personalCare'] ?? '',
      personalFinance: map['personalFinance'] ?? '',
      autoParts: map['autoParts'] ?? '',
      medical: map['medical'] ?? '',
      healthCare: map['healthCare'] ?? '',
      informationAndCommunication: map['informationAndCommunication'] ?? '',
      organizationAndCharity: map['organizationAndCharity'] ?? '',
      vehicleService: map['vehicleService'] ?? '',
      houseHoldMaintenanceAndRepair: map['houseHoldMaintenanceAndRepair'] ?? '',
      otherService: map['otherService'] ?? '',
      isSimple: map['isSimple'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GoodsServices.fromJson(String source) =>
      GoodsServices.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GoodsServices(totalGoodsSpent: $totalGoodsSpent, questionId: $questionID, totalServiceSpent: $totalServiceSpent, furnitureAndAppliance: $furnitureAndAppliance, clothing: $clothing, entertaining: $entertaining, paperOfficeReading: $paperOfficeReading, personalCare: $personalCare, personalFinance: $personalFinance, autoParts: $autoParts, medical: $medical, healthCare: $healthCare, informationAndCommunication: $informationAndCommunication, organizationAndCharity: $organizationAndCharity, vehicleService: $vehicleService, houseHoldMaintenanceAndRepair: $houseHoldMaintenanceAndRepair, otherService: $otherService, isSimple: $isSimple)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GoodsServices &&
        other.totalGoodsSpent == totalGoodsSpent &&
        other.questionID == questionID &&
        other.totalServiceSpent == totalServiceSpent &&
        other.furnitureAndAppliance == furnitureAndAppliance &&
        other.clothing == clothing &&
        other.entertaining == entertaining &&
        other.paperOfficeReading == paperOfficeReading &&
        other.personalCare == personalCare &&
        other.personalFinance == personalFinance &&
        other.autoParts == autoParts &&
        other.medical == medical &&
        other.healthCare == healthCare &&
        other.informationAndCommunication == informationAndCommunication &&
        other.organizationAndCharity == organizationAndCharity &&
        other.vehicleService == vehicleService &&
        other.houseHoldMaintenanceAndRepair == houseHoldMaintenanceAndRepair &&
        other.otherService == otherService &&
        other.isSimple == isSimple;
  }

  @override
  int get hashCode {
    return totalGoodsSpent.hashCode ^
        questionID.hashCode ^
        totalServiceSpent.hashCode ^
        furnitureAndAppliance.hashCode ^
        clothing.hashCode ^
        entertaining.hashCode ^
        paperOfficeReading.hashCode ^
        personalCare.hashCode ^
        personalFinance.hashCode ^
        autoParts.hashCode ^
        medical.hashCode ^
        healthCare.hashCode ^
        informationAndCommunication.hashCode ^
        organizationAndCharity.hashCode ^
        vehicleService.hashCode ^
        houseHoldMaintenanceAndRepair.hashCode ^
        otherService.hashCode ^
        isSimple.hashCode;
  }
}
