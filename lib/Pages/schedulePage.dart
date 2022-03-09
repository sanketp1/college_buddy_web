import 'dart:developer';

import 'dart:io';
import 'dart:js';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegebuddyweb/Models/QuestionAnswerGenerator.dart';
import 'package:collegebuddyweb/Models/xlsxJsonEncoder.dart';
import 'package:collegebuddyweb/widgets/dialogueBox.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duration_picker/duration_picker.dart';

class SchedulePage extends StatefulWidget {
  GlobalKey<ScaffoldState>? scaffoldKey;
  SchedulePage({Key? key, this.scaffoldKey}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  var selctedDuration = "00:00 HH:MM";
  String? xlsxFilePath;
  int? examdur;

  FirebaseDatabase database = FirebaseDatabase.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  Uint8List? selctedFile;
  TextEditingController subjectname = TextEditingController();

  pickfile(BuildContext context) async {
    FilePickerResult? result;

    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );
    } catch (e) {
      log(e.toString());
    }

    if (result != null) {
      try {
        Uint8List? uploadfile = result.files.single.bytes;
        setState(() {
          xlsxFilePath = result!.files.single.name;
          selctedFile = uploadfile;
        });
      } catch (e) {
        log(e.toString());
      }
    }
  }

  upload(Uint8List uploadfile) async {
    final jsondata = XlsxEncoder.xlsxjsonEncoder(uploadfile);
    final questionOpt = {subjectname.text: jsondata[0]};
    final questionAnswer = jsondata[1];

    // showProgress(context);

    try {
      await database
          .ref()
          .set(questionOpt)
          .whenComplete(() => log("Question uploaded successfully..."));
      await database.ref("answerKey").set(questionAnswer).whenComplete(() {
        // Navigator.pop(context);
        log("Answer key uploaded successfully...");
      });

      firestore
          .collection("activity")
          .doc("activities")
          .set({"isDeclared": false});

      if (examdur != null) {
        database.ref("duration").set({
          "time": examdur,
          "timestamp": "${DateTime.now().hour}:${DateTime.now().minute}"
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  myDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            title: Text(
              "Status",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: Colors.green,
                  size: 32,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "All required files Uploaded Successfully.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Text(
                  "Exam is started, now student can login.",
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Ok")))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
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
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
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
                  xlsxFilePath ?? "Select .xlsx file",
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w400),
                )),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 44),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () async {
                    pickfile(context);
                  },
                  child: Text("Browse")),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          xlsxFilePath != null
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                  child: Text(
                    "Now select duration of exam then click on schedule button.",
                    style: TextStyle(color: Colors.green),
                  ),
                )
              : SizedBox(),
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
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      context: context,
                      initialTime: Duration(minutes: 30),
                    );
                    log("Selected duration : $resultingDuration");
                    String hrs = resultingDuration.toString().split(":")[0];
                    String min = resultingDuration.toString().split(":")[1];

                    if (hrs.length == 1) {
                      hrs = "0" + hrs;
                    }

                    setState(() {
                      selctedDuration = hrs + " : " + min + " HH:MM";
                      examdur = int.parse(hrs) * 60 + int.parse(min);
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
                              xlsxFilePath != null
                                  ? new Container(
                                      child: TextFormField(
                                        controller: subjectname,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                            hintText: "Enter subject name",
                                            hintStyle: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade500),
                                            border: InputBorder.none),
                                      ),
                                      decoration: new BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade500,
                                              width: 0.5),
                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(10.0)),
                                          color: Colors.white),
                                      padding: new EdgeInsets.fromLTRB(
                                          12.0, 5.0, 12.0, 5.0),
                                    )
                                  : SizedBox(),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
 progressbar(context, true);
                                        await upload(selctedFile!);
                                        final user = await firestore
                                            .collection("users")
                                            .get();

                                        try {
                                          for (int userIndex = 0;
                                              userIndex < user.docs.length;
                                              userIndex++) {
                                            firestore
                                                .collection("users")
                                                .doc(user.docs[userIndex].id)
                                                .update({
                                              "otherdata": {
                                                "isScheduled": true,
                                                "submitted": false
                                              }
                                            });
                                            log("updated of ${user.docs[userIndex].id}");
                                          }
                                        } catch (e) {
                                          log(e.toString());
                                        }
                                       
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
          ),
        ],
      ),
    );
  }

  showProgress(BuildContext context) {
    return _isLoading
        ? showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Status",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                content: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "All file uploaded successfully....",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Student can check now result on their leaderboard",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              );
            })
        : null;
  }

  progressbar(BuildContext context, bool isLoading) {
    return isLoading == true
        ? showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Text(
                    "Status",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "All file uploaded successfully...",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Now student can appear for online examination",
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Ok")),
                        ),
                      )
                    ],
                  ),
                ),
              );
            })
        : null;
  }
}
