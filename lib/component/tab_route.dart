import 'package:flutter/material.dart';
import 'file:///D:/flutter_workspace/is_takip_uyg/lib/constants/constant.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import '../pages/task_page.dart';

class TabRoute extends StatefulWidget {
  @override
  _TabRouteState createState() => _TabRouteState();
}

class _TabRouteState extends State<TabRoute> {
  int tabIndex = 0;
  List<Widget> listScreens;

  @override
  void initState() {
    super.initState();
    listScreens = [
      HomePage(),
      TaskPage(),
      ProfilePage(),
    ];
  }

  Widget build(BuildContext context) {
    return MaterialApp(
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
