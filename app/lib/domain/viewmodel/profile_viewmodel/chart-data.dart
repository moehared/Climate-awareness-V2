import 'package:app/main.dart';
import 'package:flutter/material.dart';

class ChartData {
    
  List<Data> data = [
    Data(
        name: 'Plane',
        percent: questionaireMap.result.resultAirTravelDirect?.toStringAsFixed(2) ?? '0',
        icon: 'chart-data-icon/airplane.png',
        color: Colors.amber),
    Data(
        name: 'Car',
        percent: questionaireMap.result.resultMotorVehiclesDirect?.toStringAsFixed(2)  ?? '0',
        icon: 'chart-data-icon/car.png',
        color: Colors.blue),
    Data(
        name: 'Bus',
        percent: questionaireMap.result.resultPublictransDirect?.toStringAsFixed(2) ??
                '0',
        icon: 'chart-data-icon/bus.png',
        color: Colors.deepOrange),
    Data(
        name: 'Energy',
        percent: questionaireMap.result.energy?.toStringAsFixed(2)  ??
                '0',
        icon: 'chart-data-icon/energy.png',
        color: Colors.red),
    Data(
        name: 'Food',
        percent: questionaireMap.result.resultFoodTotal?.toStringAsFixed(2) ?? '0',
        icon: 'chart-data-icon/food.png',
        color: Colors.purple),
    Data(
        name: 'Services',
        percent:questionaireMap.result.resultServicesTotal?.toStringAsFixed(2)  ??
                '0',
        icon: 'chart-data-icon/services.png',
        color: Colors.deepPurpleAccent),
  ];
  
}

class Data {
  final String name;
  final String percent;
  final String icon;
  final Color color;
  const Data({
    required this.name,
    required this.icon,
    required this.percent,
    required this.color,
  });
}
