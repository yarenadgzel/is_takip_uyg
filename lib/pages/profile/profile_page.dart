import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:is_takip_uyg/component/admin_profile_button.dart';
import 'package:is_takip_uyg/constant/constant.dart';


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
              },
            ),
            SizedBox(height: 20),
            AdminProfileButton(
              icon: Icons.assignment,
              text: "Raporlar",
              onTap: (){
              },
            ),
            SizedBox(height: 20),
            AdminProfileButton(
              icon: Icons.email,
              text: "Talepler",
              onTap: (){
              },
            ),
          ],
        ),
      ),
    );
  }
}
