import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/user/user_task_list.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/services/users/database_service_users.dart';


class UserProfilePageTaskList extends StatefulWidget {
  @override
  _UserProfilePageTaskListState createState() => _UserProfilePageTaskListState();
}

class _UserProfilePageTaskListState extends State<UserProfilePageTaskList> {
  DatabaseServiceUsers databaseServiceUsers=new DatabaseServiceUsers();
  String username;
  @override
  void initState() {
    super.initState();
    databaseServiceUsers.getUsernameByCurrentUser().then((value) => {
      this.setState(() {
        this.username = value;
      }),
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Görevlerim",
          style: kAppBarStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color:kExpansionColor,
                  ),
                  child: ExpansionTile(
                    title: Text("Servis",style: kTextStyleTaskType,),
                    children: [
                      UserTaskList(taskType: "Servis",username: username,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(width:378,child: Divider(height: 40,color: kExpansionDividerColor,thickness: 2,),),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color:kExpansionColor,
                  ),
                  child: ExpansionTile(
                    title: Text("Tamir Bakım",style: kTextStyleTaskType,),
                    children: [
                      UserTaskList(taskType: "Tamir Bakım",username: username)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(width:378,child: Divider(height: 40,color:kExpansionDividerColor,thickness: 2,)),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color:kExpansionColor,
                  ),
                  child: ExpansionTile(
                    title: Text("Revizyon",style: kTextStyleTaskType,),
                    children: [
                      UserTaskList(taskType: "Revizyon",username: username)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(width:378,child: Divider(height: 40,color:kExpansionDividerColor,thickness: 2,)),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color:kExpansionColor,
                  ),
                  child: ExpansionTile(
                    title: Text("Yeni Proje",style: kTextStyleTaskType,),
                    children: [
                      UserTaskList(taskType: "Yeni Proje",username: username)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
