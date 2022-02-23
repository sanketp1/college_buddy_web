import 'package:collegebuddyweb/Pages/homePage_subPage/home_stat.dart';
import 'package:collegebuddyweb/Pages/homePage_subPage/students.dart';
import 'package:collegebuddyweb/widgets/ring_chart.dart';
import 'package:collegebuddyweb/widgets/line_chart.dart';
import 'package:collegebuddyweb/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bgColor = Color.fromARGB(255, 250, 249, 249);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: double.infinity,
          width: 32,
        ),
        //Started building Home Page statestics
        Expanded(
            child: Container(
                color: bgColor, height: double.infinity, child: HomeStat())),
        Container(
          width: 0.3,
          height: double.infinity,
          color: Colors.grey.shade600,
        ),
        Container(
          height: double.infinity,
          width: width * 0.27,
          color: bgColor,
          child: Students(),
        )
      ],
    );
  }
}

class MyLabel extends StatelessWidget {
  String label;
  Color color;
  MyLabel({Key? key, required this.color, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: color,
          ),
          Text(label)
        ],
      ),
    );
  }
}
