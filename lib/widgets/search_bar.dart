import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  double height;
  double width;
  SearchBar({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(
          0xffffffff,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(
              0xc000000,
            ),
            offset: Offset(
              4,
              6,
            ),
            blurRadius: 6,
          ),
        ],
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade600,
            ),
            hintText: "Search"),
      ),
    );
  }
}
