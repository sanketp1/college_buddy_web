import 'package:collegebuddyweb/homeScreen.dart';
import 'package:collegebuddyweb/widgets/hexColor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileScreenLayout extends StatelessWidget {
  MobileScreenLayout({Key? key}) : super(key: key);
  //creating a textediting controller for email
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double midWindowWidth = width * 0.8;
    double midWindowheight = height * 0.85;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/LoginPage.png",
              ),
              fit: BoxFit.fill)),
      child: Center(
        child: Container(
          height: midWindowheight * 0.6,
          width: midWindowWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage("assets/Rectangle2.png"),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                top: 45,
                left: 10,
                child: Text("Welcome to College Budyy!",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Positioned(
                top: 74,
                left: 10,
                child: Text("Kindly login to move on Dashboard",
                    style: GoogleFonts.ptSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.8))),
              ),
              Positioned(
                  top: 130,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: midWindowWidth,
                    padding: EdgeInsets.all(10),
                    height: 46,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: HexColor.fromHex("#4C58C9").withOpacity(0.54),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      cursorColor: Colors.white,
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          prefixIconColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  )),
              Positioned(
                  top: 190,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: midWindowWidth,
                    padding: EdgeInsets.all(10),
                    height: 46,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: HexColor.fromHex("#4C58C9").withOpacity(0.54),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      obscureText: true,
                      cursorColor: Colors.white,
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          prefixIconColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  )),
              Positioned(
                  top: 260,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 110,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ],
                          color: Color.fromRGBO(115, 54, 255, 1),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
