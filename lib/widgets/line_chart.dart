import 'dart:math';

import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';

class LineGraph extends StatelessWidget {
  // Generate some dummy data for the cahrt
  double? width ;
  LineGraph({this.width});
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: dummyData1,
              isCurved: true,
              barWidth: 3,
              colors: [
                Colors.red,
              ],
            ),
            LineChartBarData(
              spots: dummyData2,
              isCurved: true,
              barWidth: 3,
              colors: [
                Colors.orange,
              ],
            ),
            LineChartBarData(
              spots: dummyData3,
              isCurved: false,
              barWidth: 3,
              colors: [
                Colors.blue,
              ],
            )
          ],
        ),
      ),
    );
  }
}
