import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

class RingChart extends StatelessWidget {
  RingChart({Key? key}) : super(key: key);

  Map<String, double> dataMap = {
    "Completed Task": 5,
    "In Progress": 3,
    "Achieved Goals": 2
  };
  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromARGB(255, 246, 133, 58),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];
  final colorList = <Color>[
    Color(0xfffdcb6e),
    Color(0xff0984e3),
    Color(0xfffd79a8),
    Color.fromARGB(255, 255, 65, 17),
    Color(0xff6c5ce7),
  ];

  @override
  Widget build(BuildContext context) {
    return PieChart(
        dataMap: dataMap,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 3.2,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 32,
        centerText: "Status",
        centerTextStyle: GoogleFonts.poppins(
            color: Colors.black, fontWeight: FontWeight.w500),
        legendOptions: LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.left,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
        // gradientList: ---To add gradient colors---
        gradientList: gradientList,
        emptyColorGradient: [
          Color(0xff6c5ce7),
          Colors.blue,
        ]
        // emptyColorGradient: ---Empty Color gradient---
        );
  }
}




// Pass gradient to PieChart
