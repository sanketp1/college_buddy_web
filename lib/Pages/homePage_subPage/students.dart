import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegebuddyweb/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/search_bar.dart';

class Students extends StatelessWidget {
  Students({Key? key}) : super(key: key);
  final _firestore = FirebaseFirestore.instance.collection("users").snapshots();
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
        StreamBuilder(
            stream: _firestore,
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final user = Map<String, dynamic>.from(
                              snapshot.data!.docs[index].data() as Map);
                          final userDetail = UserModel.fromMap(user);
                          return Container(
                            color: Colors.white,
                            margin: EdgeInsets.all(5),
                            child: ListTile(
                                autofocus: true,
                                selectedColor: Colors.green,
                                leading:
                                    CircleAvatar(child: Icon(Icons.person)),
                                onTap: () {},
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                                title: Text(
                                  "${userDetail.fname} ${userDetail.lname}",
                                  style: GoogleFonts.ptSans(
                                      fontWeight: FontWeight.w500),
                                )),
                          );
                        }),
                  );
                } else {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("An error occured."),
                    );
                  } else {
                    return Center(
                      child: Text("data does not exist."),
                    );
                  }
                }
              }
            })
      ],
    );
  }
}
