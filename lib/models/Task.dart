import 'dart:core';

class Task {
  String taskName;
  List users;
  String company;
  String address;
  String taskType;
  String taskStatus;
  String creationDate;
  String startDate;
  String finishDate;
  String info;

  Task();

  @override
  String toString() {
    return 'Task{taskName: $taskName, users: $users, company: $company, address: $address, taskType: $taskType, taskStatus: $taskStatus, creationDate: $creationDate, startDate: $startDate, finishDate: $finishDate, info: $info}';
  }

  Map<String, dynamic> toJson() => {
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
}
