import 'dart:core';
import 'package:uuid/uuid.dart';

class Task {
  String taskID;
  String taskName;
  String users;
  String company;
  String address;
  String taskType;
  String taskStatus;
  String creationDate;
  String startDate;
  String finishDate;
  String info;

  Task(){
    this.taskID = Uuid().v4().toString();
  }

  @override
  String toString() {
    return 'Task{taskName: $taskName, users: $users, company: $company, address: $address, taskType: $taskType, taskStatus: $taskStatus, creationDate: $creationDate, startDate: $startDate, finishDate: $finishDate, info: $info}';
  }

  Map<String, dynamic> toJson() => {
        'taskID': taskID,
        'taskName': taskName,
        'users': users,
        'company': company,
        'address': address,
        'taskType': taskType,
        'taskStatus': taskStatus,
        'creationDate': creationDate,
        'startDate': startDate,
        'finishDate': finishDate,
        'info': info
      };

  jsonToTask(task){
    this.taskID = task["taskID"];
    this.taskName = task["taskName"];
    this.users = task["users"];
    this.company = task["company"];
    this.address = task["address"];
    this.taskType = task["taskType"];
    this.taskStatus = task["taskStatus"];
    this.creationDate = task["creationDate"];
    this.startDate = task["startDate"];
    this.finishDate = task["finishDate"];
    this.info = task["info"];
  }
}
