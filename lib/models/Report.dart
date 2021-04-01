import 'dart:core';

class Report {
  String reportName;
  String creater;
  String firstLocation;
  String lastLocation;
  String startTime;
  String finishTime;
  String status;
  String info;

  Report();

  @override
  String toString() {
    return 'Report{reportName: $reportName, creater: $creater, firstLocation: $firstLocation, lastLocation: $lastLocation, startTime: $startTime, finishTime: $finishTime, status: $status, info: $info}';
  }


}
