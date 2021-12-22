import 'package:flutter/widgets.dart';

class PublicTransitModel {
  final String title;
  String hinText;
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  PublicTransitModel({
    required this.title,
    required this.hinText,
  });
}

final publicTransitList = [
  PublicTransitModel(title: 'Bus', hinText: '237 Km/year'),
  PublicTransitModel(
      title: 'Transit Rail (light & heavy)', hinText: '177 Km/year'),
  PublicTransitModel(title: 'Commuter Rail', hinText: '118'),
  PublicTransitModel(title: 'Inter-city Rail (Amtrak)', hinText: '59 Km/year'),
];

class AirTravelModel {
  final String title;

  final TextEditingController textEditingController = TextEditingController();

  final FocusNode focusNode = FocusNode();
  String hintText;

  String dropdownValue;

  AirTravelModel({
    required this.title,
    required this.hintText,
    required this.dropdownValue,
  });
}

final airTravelList = [
  AirTravelModel(
    title: 'Short (< 640 km/yr)',
    hintText: '2',
    dropdownValue: 'Flights/year',
  ),
  AirTravelModel(
    title: 'Medium (640 - 2410 km/yr)',
    hintText: '5',
    dropdownValue: 'Flights/year',
  ),
  AirTravelModel(
    title: 'Long (2410 - 4830 km/yr)',
    hintText: '0',
    dropdownValue: 'Flights/year',
  ),
  AirTravelModel(
    title: 'Extended (> 4830 km/yr)',
    hintText: '0',
    dropdownValue: 'Flights/year',
  ),
];
