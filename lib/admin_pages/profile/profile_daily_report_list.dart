import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/report_daily_list.dart';
import 'package:is_takip_uyg/constant/constant.dart';

class ProfileDailyReportList extends StatefulWidget {
  @override
  _ProfileDailyReportListState createState() => _ProfileDailyReportListState();
}

class _ProfileDailyReportListState extends State<ProfileDailyReportList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Günlük Raporlar",
          style: kAppBarStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: kExpansionColor,
                  ),
                  child: ExpansionTile(
                    title: Text(
                      "Yaren Adıgüzel",
                      style: kTextStyleTaskType,
                    ),
                    children: [
                      ReportListDaily(
                        id: "U0CNgao6I0Y4SKwjyxaujzRHE6y2",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 378,
                child: Divider(
                  height: 40,
                  color: kExpansionDividerColor,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: kExpansionColor,
                  ),
                  child: ExpansionTile(
                    title: Text(
                      "Emre Aydın",
                      style: kTextStyleTaskType,
                    ),
                    children: [
                      ReportListDaily(
                          id: "TPKoLWhuqtdJJcqq1bvtW3O39DJ3",
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 378,
                  child: Divider(
                    height: 40,
                    color: kExpansionDividerColor,
                    thickness: 2,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: kExpansionColor,
                  ),
                  child: ExpansionTile(
                    title: Text(
                      "Berfin Bigün",
                      style: kTextStyleTaskType,
                    ),
                    children: [
                      ReportListDaily(
                        id: "rX9PnKHdHSPk0BfIZkMBkG2nUUp1",
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 378,
                  child: Divider(
                    height: 40,
                    color: kExpansionDividerColor,
                    thickness: 2,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: kExpansionColor,
                  ),
                  child: ExpansionTile(
                    title: Text(
                      "Oğuz Çelik",
                      style: kTextStyleTaskType,
                    ),
                    children: [
                      ReportListDaily(
                        id: "DUVtJGYGXXNAkl3ArhK6AX1tDc2",
                      )
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
