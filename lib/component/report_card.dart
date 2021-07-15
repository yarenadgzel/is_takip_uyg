import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/report_alert_dialog.dart';
import 'package:is_takip_uyg/models/Report.dart';
import 'package:is_takip_uyg/services/tasks/database_service_tasks.dart';
import 'package:is_takip_uyg/services/users/database_service_users.dart';

class ReportCard extends StatefulWidget {
  final IconData icon;
  final Color color;
  dynamic report;

  ReportCard({this.report, this.icon, this.color});

  @override
  _ReportCardState createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  DatabaseServiceUsers databaseServiceUsers = new DatabaseServiceUsers();
  String username = "";
  Report report = new Report();

  @override
  void initState() {
    super.initState();
    databaseServiceUsers
        .getUsernameByUserID(widget.report["creater"])
        .then((value) => {
              this.setState(() {
                this.username = value;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        print(report.jsonToReport(widget.report));
        showCustomDialogReport(context, report);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 7, right: 7),
            height: 180,
            width: 460,
            child: Card(
              color: widget.color,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(
                          widget.icon,
                          color: Colors.white,
                          size: 60,
                        )),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text(
                                  "Rapor Adı:",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(widget.report['reportName'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700))),
                            Expanded(
                                flex: 1,
                                child: Text("Oluşturan:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))),
                            Expanded(
                              flex: 2,
                              child: Text(username,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 120,
                        child: VerticalDivider(
                          width: 3,
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text(
                                  "Başlangıç Saati:",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                    widget.report["startTime"]
                                        .toDate()
                                        .toString()
                                        .substring(0, 16),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700))),
                            Expanded(
                                flex: 1,
                                child: Text("Bitiş Saati:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))),
                            Expanded(
                              flex: 2,
                              child: Text(
                                  widget.report["finishTime"] == null
                                      ? ""
                                      : widget.report["finishTime"]
                                          .toDate()
                                          .toString()
                                          .substring(0, 16),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 17),
        ],
      ),
    );
  }
}
