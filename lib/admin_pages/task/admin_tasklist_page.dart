import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:is_takip_uyg/admin_pages/task/admin_task_creation_page.dart';
import 'package:is_takip_uyg/component/admin/admin_task_list_card.dart';
import 'package:is_takip_uyg/component/deneme.dart';
import 'package:is_takip_uyg/constant/constant.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AdminTaskListCard(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Deneme(status:"Beklemede")
                    ));
              },
              title: "Bekleyen Görevler",
              subtitle: "Henüz başlatılmamış,beklemede olan görevler",
              color: Color(0xffa3605d),
              iconData: Icons.insert_invitation,
              iconColor: Colors.white,
            ),
            SizedBox(
              height: 30,
            ),
            AdminTaskListCard(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Deneme(status: "Devam Ediyor"),
                    ));
              },
              title: "Devam Eden Görevler",
              subtitle: "Aktif olarak devam eden görevler",
              color: Color(0xbfeb9052),
              iconData: Icons.event_note,
              iconColor: Colors.white,
            ),
            SizedBox(
              height: 30,
            ),
            AdminTaskListCard(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Deneme(status:"Bitirildi")
                    ));
              },
              title: "Bitirilen Görevler",
              subtitle: "Tamamlanmış olan görevler",
              color: Colors.green,
              iconData: Icons.event_available,
              iconColor: Colors.white,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>AdminTaskCretionPage()));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF1C313A),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
