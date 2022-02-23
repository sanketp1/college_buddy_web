import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  double width;
  double height;
  Color? color;
  Gradient? gradient;
  BoxShadow? boxShadow;
  Widget widget;
  MyBox(
      {Key? key,
      this.boxShadow,
      required this.width,
      required this.height,
      this.color = Colors.white,
      this.gradient,
      required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shadow = BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
        offset: Offset(4, 6),
        blurRadius: 4);
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [boxShadow ?? shadow],
          color: color,
          gradient: gradient),
      child: widget,
    );
  }
}
