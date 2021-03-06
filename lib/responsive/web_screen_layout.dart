import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../homeScreen.dart';
import '../widgets/hexColor.dart';


class WebScreenLayout extends StatelessWidget {
   WebScreenLayout({ Key? key }) : super(key: key);


   //creating a textediting controller for email
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double midWindowWidth = width * 0.8;
    double midWindowheight = height * 0.85;
    return Scaffold(
      body: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/LoginPage.png"), fit: BoxFit.cover)),
      child: Center(
        child: Container(
          width: midWindowWidth,
          height: midWindowheight,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Row(children: [
            Container(
              width: midWindowWidth * 0.46,
              height: midWindowWidth,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Rectangle2.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              width: midWindowWidth * 0.54,
              height: midWindowheight,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 75),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome to college Buddy!",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 28,
                            ),
                          ),
                          Text(
                            "Kindly login to move on Dashboard",
                            style: GoogleFonts.ptSans(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: (midWindowWidth * 0.54) * 0.65,
                    height: midWindowheight * 0.08,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      controller: _email,
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: HexColor.fromHex("#7336FF"), width: 2.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade500, width: 1.0),
                          ),
                          hintText: 'Email',
                          labelText: "Enter your email",
                          labelStyle: GoogleFonts.ptSans(color: Colors.grey)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: (midWindowWidth * 0.54) * 0.65,
                    height: midWindowheight * 0.08,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: HexColor.fromHex("#7336FF"), width: 2.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade500, width: 1.0),
                          ),
                          hintText: 'Password',
                          labelText: "Enter your Password",
                          labelStyle: GoogleFonts.ptSans(color: Colors.grey)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: HexColor.fromHex("#7336FF"),
                            minimumSize: Size(120, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          if (_email.text == "psanket18@gmail.com" &&
                              _password.text == "Sanket@123") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          } else {
                            print("incorrect credentials");
                          }
                        },
                        child: Text("Login",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.w600))),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    )
      
    );
  }
}