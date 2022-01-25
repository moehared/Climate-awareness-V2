import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/profile_viewmodel/chart-data.dart';
import 'package:app/domain/viewmodel/profile_viewmodel/chart_details_viewModel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartDetailsView extends StatelessWidget {
  static const routeName = '/ChartDetailsView';
  const ChartDetailsView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BuildViewModel<ChartDetailsViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Your Footprint Details'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1.5,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            return;
                          }
                          model.setTouchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        },
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: model.section,
                    ),
                  ),
                ),
                ...ChartData().data
                    .map(
                      (data) => Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(4),
                            padding: EdgeInsets.all(15),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(32),
                              ),
                              color: data.color,
                              border: Border.all(color: Colors.grey),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(data.name)
                        ],
                      ),
                    )
                    .toList()
              ],
            ),
          ),
        );
      },
    );
  }
}
