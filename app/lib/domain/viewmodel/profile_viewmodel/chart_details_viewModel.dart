import 'package:app/domain/viewmodel/base_viewmodel/baseview_model.dart';
import 'package:app/domain/viewmodel/profile_viewmodel/chart-data.dart';
import 'package:app/ui/widgets/badge-widget/badge.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartDetailsViewModel extends BaseViewModel {
  int _touchedIndex = -1;

  List<PieChartSectionData> get section => ChartData.data
      .asMap()
      .map<int, PieChartSectionData>((index, data) {
        final isTouched = index == _touchedIndex;

        final radius = isTouched ? 100.0 : 80.0;
        final widgetSize = isTouched ? 55.0 : 40.0;
        return MapEntry(
          index,
          PieChartSectionData(
            radius: radius,
            titleStyle: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            color: data.color,
            value: double.tryParse(data.percent),
            title: '\t${data.percent}%',
            badgeWidget: Badge(
              data.icon,
              size: widgetSize,
              borderColor: data.color,
            ),
            badgePositionPercentageOffset: .98,
          ),
        );
      })
      .values
      .toList();

  set setTouchedIndex(int? touchedIndex) {
    if (touchedIndex == null) return;
    this._touchedIndex = touchedIndex;
    notifyListeners();
  }
}
