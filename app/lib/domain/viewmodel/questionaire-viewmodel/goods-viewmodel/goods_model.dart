import 'package:flutter/material.dart';

class GoodsModel {
  final String title;
  final textEditingController = TextEditingController();
  final focusNode = FocusNode();
  final String hintText;
  String dropdownValue;
  GoodsModel({
    required this.title,
    required this.hintText,
    required this.dropdownValue,
  });
}

final goodsList = [
  GoodsModel(
    title: 'Furniture & Appliances',
    hintText: '47',
    dropdownValue: '\$/month',
  ),
  GoodsModel(
    title: 'Clothing',
    hintText: '0',
    dropdownValue: '\$/month',
  ),
  GoodsModel(
    title: 'Entertaining',
    hintText: '150',
    dropdownValue: '\$/month',
  ),
  GoodsModel(
    title: 'Paper, office, & reading',
    hintText: '0',
    dropdownValue: '\$/month',
  ),
  GoodsModel(
    title: 'Personal care & cleaning',
    hintText: '350',
    dropdownValue: '\$/month',
  ),
  GoodsModel(
    title: 'Auto parts',
    hintText: '30',
    dropdownValue: '\$/month',
  ),
];

class ServiceModel {
  final String title;
  final textEditingController = TextEditingController();
  final focusNode = FocusNode();
  final String hintText;
  String dropdownValue;
  ServiceModel({
    required this.title,
    required this.hintText,
    required this.dropdownValue,
  });
}

final serviceList = [
  ServiceModel(
    title: 'Health Care',
    hintText: '0',
    dropdownValue: '\$/month',
  ),
  ServiceModel(
    title: 'Medical',
    hintText: '100',
    dropdownValue: '\$/month',
  ),
  ServiceModel(
    title: 'Information & Communication',
    hintText: '100',
    dropdownValue: '\$/month',
  ),
  ServiceModel(
    title: 'Organizations & Charity',
    hintText: '200',
    dropdownValue: '\$/month',
  ),
  ServiceModel(
    title: 'Vehicle service',
    hintText: '300',
    dropdownValue: '\$/month',
  ),
  ServiceModel(
    title: 'Personal business & finance',
    hintText: '500',
    dropdownValue: '\$/month',
  ),
  ServiceModel(
    title: 'Household maintenance & repair',
    hintText: '300',
    dropdownValue: '\$/month',
  ),
  ServiceModel(
    title: 'Other services',
    hintText: '100',
    dropdownValue: '\$/month',
  ),
];
