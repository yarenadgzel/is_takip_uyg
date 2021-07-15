import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/report_card.dart';
import 'package:is_takip_uyg/models/LoggedInUser.dart';
import 'package:is_takip_uyg/services/reports/database_service_reports.dart';
import 'package:provider/provider.dart';

const oneDay = 60 * 60 * 24 * 1000;

class ReportListByDate extends StatelessWidget {
  DocumentSnapshot snapshot;
  DatabaseServiceReports databaseServiceReports = new DatabaseServiceReports();
  final CollectionReference reportsRef =
      Firestore.instance.collection("reports");


  @override
  Widget build(BuildContext context) {
    final loggedInUser = Provider.of<LoggedInUser>(context);
    List list;
    return StreamBuilder(
        stream:
            databaseServiceReports.getReportStreamByUserID(loggedInUser.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return Container(
              height: 350,
              child: new ListView(children: getReportListByDate(snapshot)));
        });
  }

  getReportList(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents
        .map(
          (doc) => ReportCard(
            report: doc,
            color: doc["status"] == "Başlatıldı"
                ? Color(0xbfeb9052)
                : Colors.green,
            icon: doc["status"] == "Başlatıldı"
                ? Icons.event_note
                : Icons.event_available,
          ),
        )
        .toList();
  }

  getReportListByDate(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents
        .map(
          (doc) => (DateTime.now().difference(
                          DateTime.parse(doc['startTime'].toDate().toString())))
                      .inMilliseconds <=
                  oneDay
              ? ReportCard(
                  report: doc,
                  color: doc["status"] == "Başlatıldı"
                      ? Color(0xbfeb9052)
                      : Colors.green,
                  icon: doc["status"] == "Başlatıldı"
                      ? Icons.event_note
                      : Icons.event_available,
                )
              : Container(),
        )
        .toList();
  }

/*getDataListByDate(List list) {
    List filteredList = new List();
    list.forEach((item) => {
          if ((DateTime.now().difference(
                      DateTime.parse(item['startTime'].toDate().toString())))
                  .inMilliseconds <=
              oneDay)
            {filteredList.add(item)}
        });
    return filteredList
        .map((doc) => doc["status"] == "Başlatıldı"
            ? ReportCard(
                report: doc,
                color: Color(0xbfeb9052),
                icon: Icons.event_note,
              )
            : ReportCard(
                report: doc,
                color: Colors.green,
                icon: Icons.event_available,
              ))
        .toList();
  }*/
}
