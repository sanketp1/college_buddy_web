import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/search_bar.dart';

class Students extends StatelessWidget {
  const Students({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: Text("Students",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 18)),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: SearchBar(
              width: width * 0.25,
              height: 36,
            )),
        Expanded(
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                      autofocus: true,
                      selectedColor: Colors.green,
                      leading: CircleAvatar(child: Icon(Icons.person)),
                      onTap: () {},
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                      title: Text(
                        "Patil Sanket Atmaram",
                        style: GoogleFonts.ptSans(fontWeight: FontWeight.w500),
                      )),
                );
              }),
        ),
      ],
    );
  }
}
