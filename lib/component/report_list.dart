import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/report_card.dart';
import 'package:is_takip_uyg/models/LoggedInUser.dart';
import 'package:is_takip_uyg/services/reports/database_service_reports.dart';
import 'package:provider/provider.dart';

const oneDay = 60 * 60 * 24 * 1000;

class ReportList extends StatelessWidget {
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
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          if (snapshot.data != null) {
            list = new List();
            snapshot.data.data.forEach((key, value) => {
                  list.add(value),
                });
          }
          return Container(
              height: 350,
              child: new ListView(children: getDataListByDate(list)));
        });
  }

  getDataList(List list) {
    return list
        .map((doc) => ReportCard(
              report: doc,
            ))
        .toList();
  }

  getDataListByDate(List list) {
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
                color:Color(0xbfeb9052),
                icon: Icons.event_note,
              )
            : ReportCard(
                report: doc,
                color: Colors.green,
                icon: Icons.event_available,
              ))
        .toList();
  }

// getDataList(List list) {
//   return list
//       .map(
//         (doc) => new ListTile(
//           onTap: () {},
//           title: new Text(doc["reportID"]),
//           subtitle: new Text(doc["reportName"]),
//           trailing: IconButton(
//             icon: Icon(
//               Icons.delete,
//               color: Colors.red,
//             ),
//             onPressed: () {},
//           ),
//         ),
//       )
//       .toList();
// }
}
