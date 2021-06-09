import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:is_takip_uyg/component/report_list.dart';
import 'package:is_takip_uyg/constant/constant.dart';

class UserProfilePageReportList extends StatefulWidget {
  @override
  _UserProfilePageReportListState createState() =>
      _UserProfilePageReportListState();
}

class _UserProfilePageReportListState extends State<UserProfilePageReportList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Raporlarım",
          style: kAppBarStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            ReportList()
          ],
        ),
      ),
    );
  }
}
