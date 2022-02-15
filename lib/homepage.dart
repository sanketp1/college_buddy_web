import 'package:collegebuddyweb/Pages/coursespage.dart';
import 'package:collegebuddyweb/Pages/schedulePage.dart';
import 'package:collegebuddyweb/Pages/dashboard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                print("Tapped");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SchedulePage()));
              },
              leading: Icon(Icons.schedule),
              title: Text("Schedule"),
            ),
            ListTile(
              onTap: () {
                print("Tapped");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CoursesPage()));
              },
              leading: Icon(Icons.engineering),
              title: Text("My Course"),
            )
          ],
        ),
      ),
      body: Center(
        child: Text('This is Home'),
      ),
    );
  }
}
