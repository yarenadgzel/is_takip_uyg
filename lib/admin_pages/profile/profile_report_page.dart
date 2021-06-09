import 'package:flutter/material.dart';
import 'package:is_takip_uyg/admin_pages/profile/profile_daily_report_list.dart';
import 'package:is_takip_uyg/admin_pages/profile/profile_past_report_list.dart';
import 'package:is_takip_uyg/constant/constant.dart';

class ProfileReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Raporlar",
          style: kAppBarStyle,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileReportList(
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>ProfileDailyReportList()));
                },
                color:  Color(0xffa3605d),
                title: "Günlük Raporlar",
                subtitle: "Kullanıcıların günlük raporlarını görüntüler",
                iconData: Icons.event_note,
              ),
              SizedBox(height: 40,),
              ProfileReportList(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>ProfilePastReportList()));
                },
                color: Colors.green,
                title: "Geçmiş Raporlar",
                subtitle: "Kullanıcıların geçmiş raporlarını görüntüler",
                iconData: Icons.event_available,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileReportList extends StatelessWidget {
  final Function onTap;
  final Color color;
  final String title;
  final String subtitle;
  final IconData iconData;

  ProfileReportList(
      {this.color, this.onTap, this.title, this.subtitle, this.iconData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160,
        width: 400,
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25.0)),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: kTextStyleAdminTaskListTitle,
                      ),
                      Container(
                          width: 200,
                          child: Divider(
                            thickness: 3,
                            color: Colors.white,
                          )),
                      Text(
                        subtitle,
                        style: kTextStyleAdminTaskListSubtitle,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Icon(
                  iconData,
                  size: 70,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
