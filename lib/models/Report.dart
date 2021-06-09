import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Report {
  String reportID;
  String reportName;
  String creater;
  String firstLocation;
  String lastLocation;
  Timestamp startTime;
  Timestamp finishTime;
  String status;
  String info;

  Report() {
    this.reportID = Uuid().v4().toString();
  }

  @override
  String toString() {
    return 'Report{reportName: $reportName, creater: $creater, firstLocation: $firstLocation, lastLocation: $lastLocation, startTime: $startTime, finishTime: $finishTime, status: $status, info: $info}';
  }

  Map<String, dynamic> toJson() {
    return {
      'reportID': reportID,
      'reportName': reportName,
      'creater': creater,
      'firstLocation': firstLocation,
      'lastLocation': lastLocation,
      'startTime': startTime,
      'finishTime': finishTime,
      'status': status,
      'info': info
    };
  }

  jsonToReport(report){
    this.reportID = report["reportID"];
    this.reportName = report["reportName"];
    this.creater = report["creater"];
    this.firstLocation = report["firstLocation"];
    this.lastLocation = report["lastLocation"];
    this.startTime = report["startTime"];
    this.finishTime = report["finishTime"];
    this.status = report["status"];
    this.info = report["info"];
  }
}
