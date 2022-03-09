import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:collegebuddyweb/Models/UserModel.dart';
import 'package:collegebuddyweb/Models/questionAnswerChecker.dart';
import 'package:collegebuddyweb/helper/db.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/hexColor.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String questionPapername = "";

  @override
  void initState() {
    super.initState();
    getquestionPapername();
  }

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');

  FirebaseDatabase db = FirebaseDatabase.instance;

  myDB answerKey = myDB();
  List declareDuration = [];

  Future<List> checkTime() async {
    DatabaseEvent databaseEvent = await db.ref("duration").once();

    Map<String, dynamic> map =
        databaseEvent.snapshot.value as Map<String, dynamic>;

    

    int examDur = map["time"];
    
    final timeStamp = map["timestamp"];
    int hrs = int.parse(timeStamp.toString().split(":")[0]);
    int min = int.parse(timeStamp.toString().split(":")[1]);
    int requiredtime = min + (examDur * 2);

    while (requiredtime > 60) {
      requiredtime = requiredtime - 60;
      hrs++;
      if (hrs > 23) {
        hrs = 0;
      }
    }
    min = requiredtime;

    return [hrs, min];
  }

  canDeclare() async {
    //it return hours at index 0 & minutes at index 1
    DateTime dateTime = DateTime.now();
    List declareTime = await checkTime();

    setState(() {
      declareDuration = declareTime;
    });
    if (dateTime.hour >= declareTime[0] && dateTime.minute >= declareTime[1]) {
      return true;
    } else {
      return false;
    }
  }

  Future pushMarks(String useruid, int marks) async {
    _collectionRef.doc(useruid).update({
      "marks": marks,
      "otherdata": {"isScheduled": false, "submitted": false}
    }).whenComplete(() =>       log("Marks uploaded of ${useruid} successfully"));
  }

  myDB globalUserResponse = myDB();

  getquestionPapername() async {
    DatabaseReference ref = db.ref();
    DatabaseEvent event = await ref.once();
    String questionKey = "";

    final data = Map<String, dynamic>.from(event.snapshot.value as Map);
    data.forEach((key, value) {
      if (key.toString().toLowerCase() != "answerkey" &&
          key.toString().toLowerCase() != "duration") {
        setState(() {
          questionKey = key.toString();
        });
      }
    });
    setState(() {
      questionPapername = questionKey;
    });
  }

  Future<void> updateResult() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    List<QuestionAnswerChecker> collectedResponse = [];

    final answers = await getanswerKey();
    final totalMarks = answers.length;

    for (int index = 0; index < querySnapshot.docs.length; index++) {
      //print(index);
      final useruid = querySnapshot.docs[index].id;
      int marks = 0;

      List<QuestionAnswerChecker> responseList = [];

      final userResponses = await _collectionRef
          .doc(useruid)
          .collection("responses")
          .doc(questionPapername.toString())
          .get();

      final collectedResponse =
          Map<String, dynamic>.from(userResponses.data() as Map);
      collectedResponse.forEach((key, value) {
        responseList.add(
            QuestionAnswerChecker.fromMap(Map<String, dynamic>.from(value)));
      });

      int mark = getMarks(responseList, answers);
      pushMarks(useruid, mark);

    }

  }

  Future<List<QuestionAnswerChecker>> getanswerKey() async {
    final answers = await db.ref("answerKey").once();

    List map = answers.snapshot.value as List;
    final data = map
        .map((e) => QuestionAnswerChecker.fromMap(e as Map<String, dynamic>))
        .toList();

    return data;

    
  }

  getMarks(List responseList, List answers) {
    int marks = 0;
    for (int questionIndex = 0;
        questionIndex < responseList.length;
        questionIndex++) {
      for (int answerIndex = 0; answerIndex < answers.length; answerIndex++) {
        if (answers[answerIndex].question!.trim() ==
            responseList[questionIndex].question!.trim()) {
          if (answers[answerIndex].choice!.trim() ==
              responseList[questionIndex].choice!.trim()) {
            marks++;
          }
        }
      }
    }

    return marks;
  }

  Stream<QuerySnapshot<Object?>> marksStream() {
    Stream<QuerySnapshot<Object?>> data =
        _collectionRef.orderBy("marks", descending: true).snapshots();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                  minWidth: 120,
                  height: 40,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  color: Colors.blue,
                  child: Text(
                    "Declare Result",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  onPressed: () async {
                    final isOk = await canDeclare();
                    log("Can Declare: ${isOk}");
                    if (isOk) {
                      FirebaseFirestore.instance
                          .collection("activity")
                          .doc("activities")
                          .set({"isDeclared": true});
                      updateResult();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
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
                                    "Result declared successfully.",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "Student can check their leaderboard now.",
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
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                                child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              title: Text(
                                "Status",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_rounded,
                                    color: Colors.red,
                                    size: 32,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Sorry! You can't declare result before ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "${declareDuration[0]} : ${declareDuration[1]} HH:MM",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "kindly please try after some time later.",
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
                            ));
                          });
                    }
                  }),
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Container(
            width: width,
            height: height * 0.068,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(237, 231, 225, 225),
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Rank",
                    style: GoogleFonts.ptSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                Text(
                  "Name",
                  style: GoogleFonts.ptSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white),
                ),
                Text(
                  "ERP No",
                  style: GoogleFonts.ptSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    "Marks",
                    style: GoogleFonts.ptSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: marksStream(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Container(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final data = snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;
                            final studentdetail = UserModel.fromMap(data);
                            return Container(
                              width: width,
                              height: height * 0.068,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(237, 231, 225, 225),
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 6.0)
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text("#${index + 1}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Text(
                                      "${studentdetail.fname}  ${studentdetail.lname}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Text("${studentdetail.erp_no}",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text("${studentdetail.marks}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return Text("Not yet updated");
                    }
                  }
                }),
          )
        ],
      ),
    );
  }
}
