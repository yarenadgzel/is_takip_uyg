import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/user/user_filtered_task_list.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/services/users/database_service_users.dart';

class UserTaskPage extends StatefulWidget {
  @override
  _UserTaskPageState createState() => _UserTaskPageState();
}

class _UserTaskPageState extends State<UserTaskPage> {
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
          "Görev Listesi",
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
                      UserFilteredTaskList(taskType: "Servis",username: this.username,)
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
                      UserFilteredTaskList(taskType: "Tamir Bakım",username: this.username,)
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
                      UserFilteredTaskList(taskType: "Revizyon",username: this.username)
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
                      UserFilteredTaskList(taskType: "Yeni Proje",username: this.username)
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
