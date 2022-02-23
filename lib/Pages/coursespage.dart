import 'package:collegebuddyweb/widgets/single_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text("Courses will be displayed here.",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500))),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class CoursesPage extends StatefulWidget {
//    CoursesPage({Key? key}) : super(key: key);

//   @override
//   State<CoursesPage> createState() => _CoursesPageState();
// }

// class _CoursesPageState extends State<CoursesPage> {
//   TooltipBehavior? _tooltipBehavior;

// @override
// void initState() {
//  _tooltipBehavior = TooltipBehavior( enable: true);
//  super.initState();
// }


// static List<LineSeries<SalesData, num>> getDefaultData() {
//    final List<SalesData> chartData = <SalesData>[
//      SalesData(DateTime(2005, 0, 1), 'India', 1.5, 21, 28, 680, 760),
//      SalesData(DateTime(2006, 0, 1), 'China', 2.2, 24, 44, 550, 880),
//      SalesData(DateTime(2007, 0, 1), 'USA', 3.32, 36, 48, 440, 788),
//      SalesData(DateTime(2008, 0, 1), 'Japan', 4.56, 38, 50, 350, 560),
//      SalesData(DateTime(2009, 0, 1), 'Russia', 5.87, 54, 66, 444, 566),
//      SalesData(DateTime(2010, 0, 1), 'France', 6.8, 57, 78, 780, 650),
//     SalesData(DateTime(2011, 0, 1), 'Germany', 8.5, 70, 84, 450, 800)
//    ];
//   return <LineSeries<SalesData, num>>[
//      LineSeries<SalesData, num>(
//          enableToolTip: isTooltipVisible,
//          dataSource: chartData,
//          xValueMapper: (SalesData sales, _) => sales.numeric,
//          yValueMapper: (SalesData sales, _) => sales.sales1,
//          width: lineWidth ?? 2,
//          enableAnimation: false,
//         markerSettings: MarkerSettings(
//              isVisible: isMarkerVisible,
//              height: markerWidth ?? 4,
//              width: markerHeight ?? 4,
//              shape: DataMarkerType.Circle,
//              borderWidth: 3,
//              borderColor: Colors.red),
//          dataLabelSettings: DataLabelSettings(
//              visible: isDataLabelVisible, position: ChartDataLabelAlignment.Auto)),
//      LineSeries<SalesData, num>(
//          enableToolTip: isTooltipVisible,
//          dataSource: chartData,
//          enableAnimation: false,
//          width: lineWidth ?? 2,
//          xValueMapper: (SalesData sales, _) => sales.numeric,
//          yValueMapper: (SalesData sales, _) => sales.sales2,
//          markerSettings: MarkerSettings(
//              isVisible: isMarkerVisible,
//              height: markerWidth ?? 4,
//              width: markerHeight ?? 4,
//              shape: DataMarkerType.Circle,
//              borderWidth: 3,
//              borderColor: Colors.black),
//          dataLabelSettings: DataLabelSettings(
//              isVisible: isDataLabelVisible, position: ChartDataLabelAlignment.Auto))
//    ];
//  }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: SfCartesianChart(
//      title: ChartTitle(text: 'Flutter Chart'),
//     legend: Legend(isVisible: true),
//     series: getDefaultData(),
//     tooltipBehavior: _tooltipBehavior,
//    ),
//       ),
//     );
//   }
// }

// SalesData(DateTime dateTime, String s, double d, int i, int j, int k, int l) {
// }
