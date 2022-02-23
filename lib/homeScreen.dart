import 'dart:html';
import 'package:collegebuddyweb/Pages/coursespage.dart';
import 'package:collegebuddyweb/Pages/homepage.dart';
import 'package:collegebuddyweb/Pages/resultPage.dart';
import 'package:collegebuddyweb/Pages/schedulePage.dart';
import 'package:collegebuddyweb/widgets/Drawer.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String profilePic =
      "https://firebasestorage.googleapis.com/v0/b/collegebuddy-3785f.appspot.com/o/sanket-patil.png?alt=media&token=978ba8a4-07e9-4808-bb40-752cb37fc6ca";

  int index = 0;
  Widget getPage(int index) {
    switch (index) {
      case 0:
        return HomePage();

      case 1:
        return CoursePage();
      case 2:
        return SchedulePage();
      case 3:
        return ResultPage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 6, 114, 255),
          title: Text(
            "College Buddy",
            style: GoogleFonts.poppins(),
          ),
          elevation: 8,
          actions: [
            PopupMenuButton(
                color: Colors.white,
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("My Profile"),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text("Logout"),
                        value: 2,
                      ),
                      PopupMenuItem(
                        child: Text("Help"),
                        value: 3,
                      ),
                    ]),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: CircleAvatar(
            //     radius: 25,
            //     child: ClipOval(
            //       child: Image.network(
            //         profilePic,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      drawer: MyDrawer(callback: (value) {
        setState(() {
          index = value;
        });
      }),
      body:getPage(index)
    );
  }
}
