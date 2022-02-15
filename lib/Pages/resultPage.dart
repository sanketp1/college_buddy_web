import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegebuddyweb/Models/UserModel.dart';
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Result"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {}, child: Text("Declare Result")),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 45,
                width: 250,
                margin: EdgeInsets.all(30),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                    decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade500, width: 1.0),
                        ),
                        hintText: 'Search',
                        suffixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "Students",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: _firestore,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                final data = snapshot.data!.docs.asMap();

                List<UserModel> userDetails = [];
                data.forEach((key, value) {
                  userDetails.addAll([
                    UserModel.fromMap(value.data() as Map<String, dynamic>)
                  ]);
                });
                return Container(
                  width: width,
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 38, 73, 102)),
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'ERP No.',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Marks',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                    rows:
                        userDetails // Loops through dataColumnText, each iteration assigning the value to element
                            .map(
                              ((element) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(
                                          "${element.fname.toString()}  ${element.lname.toString()}")), //Extracting from Map element the value

                                      DataCell(Text(element.erp_no.toString())),
                                      DataCell(Text("120"))
                                    ],
                                  )),
                            )
                            .toList(),
                  ),
                );
              } else {
                return Container(
                  child: Center(child: Text("data doesn't exist")),
                );
              }
            }
          },
        )
            
          ],
        ));
  }
}
