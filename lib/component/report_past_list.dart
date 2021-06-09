import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/report_card.dart';
import 'package:is_takip_uyg/services/reports/database_service_reports.dart';

const oneDay = 60 * 60 * 24 * 1000;

class ReportPastList extends StatelessWidget {
  DocumentSnapshot snapshot;
  DatabaseServiceReports databaseServiceReports = new DatabaseServiceReports();
  final CollectionReference reportsRef =
      Firestore.instance.collection("reports");
  final String id;

  ReportPastList({this.id});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: databaseServiceReports.getReportStreamByUserID(id),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return Container(
              height: 350,
              child: new ListView(children: getReportList(snapshot)));
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

}
