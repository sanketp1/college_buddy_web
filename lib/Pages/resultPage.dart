import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegebuddyweb/Models/UserModel.dart';
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
  final _firestore = FirebaseFirestore.instance.collection("users").snapshots();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CupertinoButton(
                color: Colors.blue,
                child: Text("Declare Result"),
                onPressed: () {
                  print("tapped on result declared button");
                }),
          )
        ],
      ),
    );
  }
}
