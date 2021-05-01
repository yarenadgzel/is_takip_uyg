import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/task_card.dart';
import 'package:is_takip_uyg/constant/constant.dart';


class AdminTaskPage extends StatefulWidget {
  @override
  _AdminTaskPageState createState() => _AdminTaskPageState();
}

class _AdminTaskPageState extends State<AdminTaskPage> {
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 13,),
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
                    taskCard(),
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
                    Text("Tamir Bakım Görevi....",style: kExpansionTextStyle,),
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
                    Text("Revizyon Görevi....",style: kExpansionTextStyle,),
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
                    Text("YeniProje....",style: kExpansionTextStyle,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
