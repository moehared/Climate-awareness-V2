import 'package:flutter/material.dart';

class ChartData {
  static List<Data> data = [
    Data(
        name: 'Plane',
        percent: 20,
        icon: 'chart-data-icon/airplane.png',
        color: Colors.amber),
    Data(
        name: 'Car',
        percent: 40,
        icon: 'chart-data-icon/car.png',
        color: Colors.blue),
    Data(
        name: 'Bus',
        percent: 10,
        icon: 'chart-data-icon/bus.png',
        color: Colors.deepOrange),
    Data(
        name: 'Energy',
        percent: 30,
        icon: 'chart-data-icon/energy.png',
        color: Colors.red),
    Data(
        name: 'Food',
        percent: 50,
        icon: 'chart-data-icon/food.png',
        color: Colors.purple),
    Data(
        name: 'Services',
        percent: 30,
        icon: 'chart-data-icon/services.png',
        color: Colors.deepPurpleAccent),
  ];
}

class Data {
  final String name;
  final double percent;
  final String icon;
  final Color color;
  const Data({
    required this.name,
    required this.icon,
    required this.percent,
    required this.color,
  });
}
