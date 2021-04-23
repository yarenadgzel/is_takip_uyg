import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:is_takip_uyg/models/Report.dart';
import '../auth_service.dart';

class DatabaseServiceReports {
  final CollectionReference reportsRef =
      Firestore.instance.collection("reports");
  AuthService authService = new AuthService();
  DocumentSnapshot snapshot;
  List statusList = new List();

  Future saveReport(Report report) async {
    FirebaseUser user = await authService.getCurrentUser();
    await reportsRef
        .document(user.uid)
        .updateData({report.reportID: report.toJson()});
  }

  getReportStreamByUserID(String uid) {
    return reportsRef.document(uid).snapshots();
  }

  getReportStreamByUserIdAndDate(String uid, String startDate) {
    return reportsRef.document(uid).snapshots().map((event) => null);
  }

  //Sadece verileri çekip işlem yapılacksa bu kullanılacak.
  getReportByUserID(String userID) {
    reportsRef.document(userID).get().then((DocumentSnapshot snapshot) => {
          snapshot.data.forEach((String key, dynamic value) {
            //print('key:' + key);
            return (key);
            //print(value);
          })
        });
    // return reports;
  }

  getReportStatusByUserID() async {
    FirebaseUser user = await authService.getCurrentUser();
    DocumentSnapshot snapshot = await reportsRef.document(user.uid).get();
    for(var report in snapshot.data.values){
      if (report["status"] == "Başlatıldı") {
        return true;
      }
    }
    return false;
  }

  deleteReportsByID(String documentId) async {
    await reportsRef.document(documentId).delete();
  }

/*  updateReportsData(Report report) async {
    FirebaseUser user = await authService.getCurrentUser();
    await myRef.document(user.uid).updateData({
      report.reportID: report.toJson()
    });
  }*/

}
