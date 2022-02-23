import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final ValueSetter<int> callback;
  MyDrawer({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 6, 114, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Color(
                          0x42000000,
                        ),
                        offset: Offset(
                          0,
                          6,
                        ),
                        blurRadius: 4,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15)),
                accountName: Text("Sanket Patil"),
                accountEmail: Text("patil.sanket18@outlook.com")),
          ),
          ListTile(
            onTap: () {
              print("Home");
              callback(0);
              Navigator.pop(context);
            },
            leading: Icon(Icons.home_rounded),
            title: Text("Home"),
          ),
          ListTile(
            onTap: () {
              print("My Course");
              callback(1);
              Navigator.pop(context);
            },
            leading: Icon(Icons.collections_bookmark_rounded),
            title: Text("My Course"),
          ),
          ListTile(
            onTap: () {
              print("Schedule");
              callback(2);
              Navigator.pop(context);
            },
            leading: Icon(Icons.schedule_rounded),
            title: Text("Schedule"),
          ),
          ListTile(
            onTap: () {
              print('Result');
              callback(3);
              Navigator.pop(context);
            },
            leading: Icon(Icons.leaderboard_rounded),
            title: Text("Result"),
          ),
        ],
      ),
    );
  }
}
