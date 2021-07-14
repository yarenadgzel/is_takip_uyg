import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:is_takip_uyg/component/admin/admin_profile_button.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/user_pages/profile_page/user_demand_creation_page.dart';
import 'package:is_takip_uyg/user_pages/profile_page/user_demand_list_page.dart';
import 'package:is_takip_uyg/user_pages/profile_page/user_profile_page_task_list.dart';
import 'package:is_takip_uyg/user_pages/profile_page/user_profile_page_report_list.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Profil",
          style: kAppBarStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            AdminProfileButton(
              icon: Icons.people,
              text: "Görevlerim",
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfilePageTaskList()));

              },
            ),
            SizedBox(height: 20),
            AdminProfileButton(
              icon: Icons.assignment,
              text: "Raporlarım",
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfilePageReportList()));
              },
            ),
            SizedBox(height: 20),
            AdminProfileButton(
              icon: Icons.email,
              text: "Taleplerim",
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDemandListPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
