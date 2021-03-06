import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/task_card.dart';
import 'package:is_takip_uyg/services/auth_service.dart';
import 'package:is_takip_uyg/services/tasks/database_service_tasks.dart';

class UserTaskList extends StatelessWidget {
  final String username;
  final String taskType;
  DatabaseServiceTask databaseServiceTask = new DatabaseServiceTask();
  AuthService authService = new AuthService();
  DocumentSnapshot snapshot;

  UserTaskList({this.taskType, this.username});

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: databaseServiceTask.getTasksData(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return new LinearProgressIndicator();
          return Container(
              height: 350,
              child: new ListView(
                  children: getTaskList(snapshot, taskType, username)));
        });
  }

  getTaskList(
      AsyncSnapshot<QuerySnapshot> snapshot, String taskType, String username) {
    return snapshot.data.documents
        .map((doc) => doc['users'] == username && doc["taskType"] == taskType
            ? TaskCard(task: doc)
            : Container())
        .toList();
  }
}
