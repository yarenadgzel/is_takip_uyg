import 'package:flutter/material.dart';
import 'package:is_takip_uyg/admin_pages/home/home_page.dart';
import 'package:is_takip_uyg/admin_pages/profile/profile_page.dart';
import 'package:is_takip_uyg/admin_pages/task/admin_tasklist_page.dart';
import 'package:is_takip_uyg/constant/constant.dart';

class AdminTabRoute extends StatefulWidget {
  @override
  _AdminTabRouteState createState() => _AdminTabRouteState();
}

class _AdminTabRouteState extends State<AdminTabRoute> {
  int tabIndex = 0;
  List<Widget> listScreens;

  @override
  void initState() {
    super.initState();
    listScreens = [
      HomePage(),
      AdminTaskListPage(),
      ProfilePage(),
    ];
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: listScreens[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
          backgroundColor:kBottomBarColor,
          currentIndex: tabIndex,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          iconSize:30 ,
          items:<BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Anasayfa" ,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_invitation),
              label: 'Görevler',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),

      ),
    );
  }
}
