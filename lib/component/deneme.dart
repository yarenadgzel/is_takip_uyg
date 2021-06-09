import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/admin/admin_tasks_list.dart';
import 'package:is_takip_uyg/constant/constant.dart';


class Deneme extends StatelessWidget {
  final String status;
  Deneme({this.status});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Görevler",
          style: kAppBarStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20,),
              AdminTaskList(status: status,),
            ],
          ),
        ),
      ),

    );
  }
}
