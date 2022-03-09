import 'package:collegebuddyweb/Pages/LoginPage.dart';
import 'package:collegebuddyweb/Pages/homepage.dart';
import 'package:collegebuddyweb/Pages/resultPage.dart';
import 'package:collegebuddyweb/Pages/schedulePage.dart';
import 'package:collegebuddyweb/homeScreen.dart';
import 'package:collegebuddyweb/responsive/layout_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Scaffold(body: HomePage()),
      home: HomeScreen(),
    );
  }
}
