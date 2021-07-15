import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:is_takip_uyg/models/Report.dart';
import 'package:is_takip_uyg/services/auth_service.dart';

class DatabaseServiceReports {
  final CollectionReference reportsRef =
      Firestore.instance.collection("reports");
  AuthService authService = new AuthService();

  // -------------------- List View -------------------- //

  getReportStreamByUserID(String uid) {
    return reportsRef.document(uid).collection("report").snapshots();
  }

  getReportStreamByUserIdAndDate(String uid, String startDate) {
    return reportsRef.document(uid).snapshots().map((event) => null);
  }

  // -------------------- Get Save Update Delete -------------------- //

  //Sadece verileri çekip işlem yapılacksa bu kullanılacak.
  getReportByCurrentUser() async {
    FirebaseUser user = await authService.getCurrentUser();
    return await reportsRef
        .document(user.uid)
        .collection("report")
        .getDocuments();
  }

  Future saveReport(Report report) async {
    await reportsRef
        .document(report.creater)
        .collection("report")
        .document(report.reportID)
        .setData(report.toJson());
  }

  getReportByID(String id) async {
    FirebaseUser user = await authService.getCurrentUser();
    Report report = new Report();
    await reportsRef
        .document(user.uid)
        .collection("report")
        .document(id)
        .get()
        .then((value) => {
           report.jsonToReport(value.data)
    });
    return report;
  }

  updateReportsData(Report report) async {
    await reportsRef
        .document(report.creater)
        .collection("report")
        .document(report.reportID)
        .updateData(report.toJson());
  }

  deleteReportsByID(Report report) async {
    await reportsRef
        .document(report.creater)
        .collection("report")
        .document(report.reportID)
        .delete();
  }
}
