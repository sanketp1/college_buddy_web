import 'package:collegebuddyweb/responsive/mobile_screen_layout.dart';
import 'package:collegebuddyweb/responsive/web_screen_layout.dart';
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  Responsive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return Scaffold(body: WebScreenLayout());
        } else {
          return Scaffold(body: MobileScreenLayout());
        }
      },
    );
  }
}
