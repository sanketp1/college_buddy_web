import 'package:collegebuddyweb/widgets/MyBox.dart';
import 'package:collegebuddyweb/widgets/line_chart.dart';
import 'package:collegebuddyweb/widgets/ring_chart.dart';
import 'package:collegebuddyweb/widgets/search_bar.dart';
import 'package:collegebuddyweb/widgets/single_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeStat extends StatefulWidget {
  const HomeStat({Key? key}) : super(key: key);

  @override
  _HomeStatState createState() => _HomeStatState();
}

class _HomeStatState extends State<HomeStat> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("Home",
                style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600)),
          ),
          //  SearchBar(width: width * 0.2, height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Analytics",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyBox(
                  width: width * 0.32,
                  height: 200,
                  widget: Column(
                    children: [
                      Text(
                        "Student Performance",
                        style: GoogleFonts.ptSans(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: width * 0.25,
                        height: 170,
                        child: SimpleLineChart.withSampleData(),
                      )
                    ],
                  ),
                  boxShadow: BoxShadow(
                      color: Color(
                        0x16000000,
                      ),
                      offset: Offset(
                        2,
                        6,
                      ),
                      blurRadius: 4),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(
                        0xff85d967,
                      ),
                      Color(
                        0xff79d97d,
                      ),
                      Color(
                        0xef6ed991,
                      ),
                      Color(
                        0x7c67d99c,
                      ),
                      Color(
                        0x5e67d99c,
                      ),
                    ],
                    stops: [
                      0,
                      0.34,
                      0.67,
                      0.85,
                      1,
                    ],
                  ),
                ),
                MyBox(
                  width: width * 0.32,
                  height: 200,
                  boxShadow: BoxShadow(
                      color: Color(
                        0x16000000,
                      ),
                      offset: Offset(
                        2,
                        6,
                      ),
                      blurRadius: 4),
                  widget: Column(
                    children: [
                      Text(
                        "Achieved Goals",
                        style: GoogleFonts.ptSans(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: width * 0.25,
                        height: 170,
                        child: SimpleLineChart.withSampleData(),
                      )
                    ],
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(
                        0xff39caca,
                      ),
                      Color(
                        0xb710ffff,
                      ),
                      Color(
                        0xff28e1e1,
                      ),
                      Color(
                        0x7239caca,
                      ),
                    ],
                    stops: [
                      0,
                      0.56,
                      0.81,
                      1,
                    ],
                  ),
                ),
                MyBox(
                    width: width * 0.32,
                    height: 200,
                    widget: Column(
                      children: [
                        Text(
                          "Current Progress",
                          style: GoogleFonts.ptSans(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                        width: width * 0.25,
                        height: 170,
                        child: SimpleLineChart.withSampleData(),
                      )
                      ],
                    ),
                    boxShadow: BoxShadow(
                        color: Color(
                          0x16000000,
                        ),
                        offset: Offset(
                          2,
                          6,
                        ),
                        blurRadius: 4),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(
                          0xfff5b657,
                        ),
                        Color(
                          0xe5f5b657,
                        ),
                        Color(
                          0xfff5b657,
                        ),
                        Color(
                          0xfff5b657,
                        ),
                        Color(
                          0x42e8a136,
                        ),
                      ],
                      stops: [
                        0,
                        0.36,
                        0.68,
                        0.85,
                        1,
                      ],
                    ))
              ],
            ),
          ),
          moreIcon,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Academic Performance",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyBox(width: width * 0.45, height: 350, widget: LineGraph()),
                MyBox(width: width * 0.3, height: 350, widget: RingChart()),
              ],
            ),
          ),
          moreIcon,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Course Overview",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyBox(
                    width: width * 0.34,
                    height: 200,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Text(
                            "Fundamental Of Java Programming",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/icons/java.png"))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Course Progress",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        ),
                        Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: LinearProgressIndicator(
                              value: 0.7,
                              color: Colors.green,
                              semanticsLabel: "FJP Progress",
                            ))
                      ],
                    )),
                MyBox(
                    width: width * 0.34,
                    height: 200,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Text(
                            "Obect Oriented Programmming",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/icons/c-.png"))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Course Progress",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        ),
                        Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: LinearProgressIndicator(
                              value: 0.7,
                              color: Colors.green,
                              semanticsLabel: "FJP Progress",
                            ))
                      ],
                    )),
                MyBox(
                    width: width * 0.34,
                    height: 200,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Text(
                            "Embedded System Design",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/icons/processor.png"))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Course Progress",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        ),
                        Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: LinearProgressIndicator(
                              value: 0.7,
                              color: Colors.green,
                              semanticsLabel: "FJP Progress",
                            ))
                      ],
                    )),
              ],
            ),
          ),
          moreIcon
        ],
      ),
    );
  }
}

Widget moreIcon = Align(
  alignment: Alignment.bottomRight,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("See more"),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 4.0)
              ]),
          child: Icon(
            Icons.arrow_forward_rounded,
            size: 14,
            color: Colors.black,
          ),
        ),
      ],
    ),
  ),
);
