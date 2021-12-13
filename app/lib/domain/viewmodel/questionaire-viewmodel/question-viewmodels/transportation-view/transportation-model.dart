import 'package:flutter/widgets.dart';

class PublicTransitModel {
  final String title;
  final String hinText;
  final TextEditingController textEditingController = TextEditingController();
  final Function(String?)? onChange;
  final FocusNode focusNode = FocusNode();
  final Function(String?)? onDropdownChange;

  PublicTransitModel({
    required this.title,
    required this.hinText,
    this.onChange,
    this.onDropdownChange,
  });
}

final publicTransitList =  [
  PublicTransitModel(title: 'Bus', hinText: '237'),
  PublicTransitModel(title: 'Transit Rail (light & heavy)', hinText: '177'),
  PublicTransitModel(title: 'Commuter Rail', hinText: '118'),
  PublicTransitModel(title: 'Inter-city Rail (Amtrak)', hinText: '59'),
];

class AirTravelModel {
  final String title;

  final TextEditingController textEditingController = TextEditingController();

  final FocusNode focusNode = FocusNode();
  final String hintText;


   AirTravelModel({
    required this.title,
    required this.hintText,
  });
}

final airTravelList =  [
  AirTravelModel(title: 'Short (< 640 km/yr)', hintText: '2'),
  AirTravelModel(title: 'Medium (640 - 2410 km/yr)', hintText: '5'),
  AirTravelModel(title: 'Long (2410 - 4830 km/yr)', hintText: '0'),
  AirTravelModel(title: 'Extended (> 4830 km/yr)', hintText: '0'),
];
