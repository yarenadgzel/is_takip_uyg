import 'dart:core';

import 'package:uuid/uuid.dart';

class Demand {
  String demandName;
  String demandID;
  String createrID;
  String creationDate;
  String startDate;
  String finishDate;
  String approvalDate;
  String status;
  String info;

  Demand() {
    this.demandID = Uuid().v4().toString();
  }

  Map<String, dynamic> toJson() => {
        'demandName': demandName,
        'demandID': demandID,
        'createrID': createrID,
        'creationDate': creationDate,
        'startDate': startDate,
        'finishDate': finishDate,
        'approvalDate': approvalDate,
        'status': status,
        'info': info
      };

  jsonToDemand(demand) {
    this.demandName = demand["demandName"];
    this.demandID = demand["demandID"];
    this.createrID = demand["createrID"];
    this.creationDate = demand["creationDate"];
    this.startDate = demand["startDate"];
    this.finishDate = demand["finishDate"];
    this.approvalDate = demand["approvalDate"];
    this.status=demand["status"];
    this.info = demand["info"];
  }
}
