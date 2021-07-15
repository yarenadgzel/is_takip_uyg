import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:is_takip_uyg/models/Task.dart';
import 'package:is_takip_uyg/models/DropdownItem.dart';

class DatabaseServiceTask {
  final CollectionReference taskRef = Firestore.instance.collection("tasks");

  createTask(Task task) async {
    await taskRef.document(task.taskID).setData(task.toJson());
  }

  updateTask(Task task) async {
    await taskRef.document(task.taskID).updateData(task.toJson());
  }

  deleteTask(Task task) async {
    await taskRef.document(task.taskID).delete();
  }

  getTasksData() {
    return taskRef.snapshots();
  }

  getTaskByID(String taskID) async{
    print("taskID: "+taskID);
    Map<String, dynamic> task;
    await taskRef.getDocuments().then((value) => {
      task = value.documents.firstWhere((element) => element.data['taskID'] == taskID).data
    });
    return task;
  }

  getDropdownTaskListByUsername(String username) async {
    print("getDropdownTaskListByUsername username: " + username);
    if (username != null && username != "") {
      List dropdownList = [];
      await taskRef.getDocuments().then((value) => {
            value.documents.forEach((element) {
              var task = element.data;
              if (task['users'] == username &&
                  task['taskStatus'] == "Devam Ediyor") {
                DropdownItem item = new DropdownItem();
                item.key = task['taskName'];
                item.value = task['taskID'];
                dropdownList.add(item);
              }
            })
          });
      return dropdownList;
    }
  }
}
