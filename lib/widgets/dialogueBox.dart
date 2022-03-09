import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  double width;
  double height;
  Widget content;
  MyDialog({
    Key? key,
    required this.width,
    required this.height,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
