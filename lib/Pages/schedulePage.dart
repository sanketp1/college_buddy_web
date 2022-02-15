import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duration_picker/duration_picker.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  var selctedDuration = "00:00 HH:MM";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Schedule")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  "Select the .xlsx file of Questions and Answers from your local system",
                  style: GoogleFonts.ptSans(
                      fontSize: 20, fontWeight: FontWeight.w500))),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                height: 40,
                width: width * 0.35,
                decoration: BoxDecoration(
                  color: Color(
                    0xffffffff,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color(
                        0x16000000,
                      ),
                      offset: Offset(
                        4,
                        6,
                      ),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Center(
                    child: Text(
                  "Select .xlsx file",
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w400),
                )),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 44),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {},
                  child: Text("Browse"))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Select Duration: ",
              style:
                  GoogleFonts.ptSans(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                height: 40,
                width: width * 0.2,
                decoration: BoxDecoration(
                  color: Color(
                    0xffffffff,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color(
                        0x16000000,
                      ),
                      offset: Offset(
                        4,
                        6,
                      ),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Center(
                    child: Text(
                  selctedDuration,
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w400),
                )),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () async {
                    var resultingDuration = await showDurationPicker(
                      context: context,
                      initialTime: Duration(minutes: 30),
                    );
                    String hrs = resultingDuration.toString().split(":")[0];
                    String min = resultingDuration.toString().split(":")[1];
                    if (hrs.length == 1) {
                      hrs = "0" + hrs;
                    }

                    setState(() {
                      selctedDuration = hrs + " : " + min + " HH:MM";
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Chose duration: $resultingDuration')));
                  },
                  child: Text("Pick Time"))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(120, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Confirm",
                            style: GoogleFonts.poppins(color: Colors.green),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  "Are you sure do you want to start the exam?"),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Yes",
                                        style: GoogleFonts.ptSans(
                                            color: Colors.green),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "No",
                                        style: GoogleFonts.ptSans(
                                            color: Colors.red),
                                      ))
                                ],
                              )
                            ],
                          ),
                        );
                      });
                },
                child: Text("Schedule")),
          )
        ],
      ),
    );
  }
}
