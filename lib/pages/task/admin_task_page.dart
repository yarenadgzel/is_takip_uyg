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
            SizedBox(height: 10,),
            ExpansionTile(
              title: Text("Servis",style: kTextStyleTaskPage,),
              children: [
                taskCard(),
              ],
            ),
            SizedBox(height: 40,),
            ExpansionTile(
              title: Text("Tamir Bakım",style: kTextStyleTaskPage,),
              children: [
                Text("Tamir Bakım Görevi....",style: kExpansionTextStyle,),
              ],
            ),
            SizedBox(height: 40,),
            ExpansionTile(
              title: Text("Revizyon",style: kTextStyleTaskPage,),
              children: [
                Text("Revizyon Görevi....",style: kExpansionTextStyle,),
              ],
            ),
            SizedBox(height: 40,),
            ExpansionTile(
              title: Text("Yeni Proje",style: kTextStyleTaskPage,),
              children: [
                Text("YeniProje....",style: kExpansionTextStyle,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
