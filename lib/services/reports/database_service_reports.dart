import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:is_takip_uyg/models/Report.dart';
import 'package:uuid/uuid.dart';
import '../auth_service.dart';

class DatabaseServiceReports {
  final CollectionReference myRef = Firestore.instance.collection("reports");
  AuthService authService = new AuthService();

  Future createReport(Report report) async {
    FirebaseUser user = await authService.getCurrentUser();
    String reportID = Uuid().v4().toString();
    var randomReportID = jsonDecode(reportID);
    await myRef.document(user.uid).setData({
      randomReportID:report
    });
  }
}
