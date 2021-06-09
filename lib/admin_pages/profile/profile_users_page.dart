import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/constant/constant.dart';

class ProfileUsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Kullanıcılar",
          style: kAppBarStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 26,),
            UserCard(text: "Yaren Adıgüzel",),
            SizedBox(height: 26,),
            UserCard(text: "Emre Aydın",),
            SizedBox(height: 26,),
            UserCard(text: "Berfin Bigün",),
            SizedBox(height: 26,),
            UserCard(text: "Oğuz Çelik",),
          ],
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String text;
  const UserCard({this.text}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        height: 70,
        width: 400,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Expanded(
                  flex:2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12,top: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.yellow,
                          backgroundImage: AssetImage('assets/images/image.png'),
                        ),
                        SizedBox(width: 26,),
                        Text(text,style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 23),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
