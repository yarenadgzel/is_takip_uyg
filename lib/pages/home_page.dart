import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/pages/login_page.dart';
import 'file:///D:/flutter_workspace/is_takip_uyg/lib/constants/constant.dart';
import 'package:is_takip_uyg/services/auth_service.dart';
import 'package:is_takip_uyg/services/database_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isActive = true;
  IconData icon = Icons.play_arrow;
  AuthService auth = new AuthService();
  DatabaseService databaseService = new DatabaseService();
  String soyad = "";
  String ad = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Anasayfa",
          style: kAppBarStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.yellow,
                        backgroundImage: AssetImage('assets/images/image.png'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Ali Duru",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 85,
                      ),
                      Text(
                        "Çıkış",
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        icon: Icon(Icons.exit_to_app),
                        iconSize: 30,
                        onPressed: () {
                          auth.signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.green,
                ),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if (isActive == false) {
                        icon = Icons.play_arrow;
                      } else {
                        icon = Icons.pause;
                      }
                      isActive = !isActive;
                    });
                  },
                  child: Icon(
                    icon,
                    size: 55,
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                onChanged: (text) {
                  ad = text;
                },
                style: TextStyle(
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  hintText: "İsim",
                  hintStyle: TextStyle(color: Colors.black38),
                ),
              ),
              TextField(
                onChanged: (text) {
                  soyad = text;
                },
                style: TextStyle(
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  hintText: "Soyisim",
                  hintStyle: TextStyle(color: Colors.black38),
                ),
              ),
              FlatButton(
                onPressed: () async {
                  print("$ad" + "$soyad");
                  databaseService.createUserData(ad, soyad);
                },
                child: Text("Buton"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
