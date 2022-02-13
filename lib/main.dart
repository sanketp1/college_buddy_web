import 'package:collegebuddyweb/Pages/LoginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Testpage()),
    );
  }
}

class Testpage extends StatefulWidget {
  const Testpage({Key? key}) : super(key: key);

  @override
  _TestpageState createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("This is TestPage")),
    );
  }
}
