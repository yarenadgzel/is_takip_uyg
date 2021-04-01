import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:is_takip_uyg/component/admin_task_list_card.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/pages/task/task_page.dart';

class AdminTaskListPage extends StatefulWidget {
  @override
  _AdminTaskListPageState createState() => _AdminTaskListPageState();
}

class _AdminTaskListPageState extends State<AdminTaskListPage> {
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
          SizedBox(
            height: 30,
          ),
          AdminTaskListCard(
              title: "Bekleyen Görevler",
              subtitle: "Henüz başlatılmamış,beklemede olan görevler",
              color: Color(0XFF1e4eb5),
              iconData: Icons.insert_invitation),
          SizedBox(height: 20,),
          AdminTaskListCard(
            title: "Devam Eden Görevler",
            subtitle: "Aktif olarak devam eden görevler",
            color: Colors.deepOrangeAccent,
            iconData: Icons.event_note,
          ),
          SizedBox(height: 20,),
          AdminTaskListCard(
            title: "Bitirilen Görevler",
            subtitle: "Tamamlanmış olan görevler",
            color: Color(0XFF30ad23),
            iconData: Icons.event_available,
          ),
        ],
      )),
    );
  }
}
