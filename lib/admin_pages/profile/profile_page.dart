import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:is_takip_uyg/admin_pages/profile/admin_demand_page.dart';
import 'package:is_takip_uyg/admin_pages/profile/profile_report_page.dart';
import 'package:is_takip_uyg/admin_pages/profile/profile_users_page.dart';
import 'package:is_takip_uyg/component/admin/admin_profile_button.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/user_pages/profile_page/user_demand_creation_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Kullanıcı Bilgileri",
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
              text: "Kullanıcılar",
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileUsersPage()));

              },
            ),
            SizedBox(height: 20),
            AdminProfileButton(
              icon: Icons.assignment,
              text: "Raporlar",
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileReportPage()));
              },
            ),
            SizedBox(height: 20),
            AdminProfileButton(
              icon: Icons.email,
              text: "Talepler",
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminDemandListPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
