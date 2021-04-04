import 'dart:core';

import 'package:uuid/uuid.dart';

class Report {
  String reportID;
  String reportName;
  String creater;
  String firstLocation;
  String lastLocation;
  String startTime;
  String finishTime;
  String status;
  String info;

  //Parametresiz Contructor (Yapılandırıcı)
  Report(){
    this.reportID = Uuid().v4().toString();
  }

  @override
  String toString() {
    return 'Report{reportName: $reportName, creater: $creater, firstLocation: $firstLocation, lastLocation: $lastLocation, startTime: $startTime, finishTime: $finishTime, status: $status, info: $info}';
  }

  Map toJson() => {
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
