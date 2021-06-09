import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/task_card.dart';
import 'package:is_takip_uyg/services/auth_service.dart';
import 'package:is_takip_uyg/services/tasks/database_service_tasks.dart';


class AdminTaskList extends StatelessWidget {
  final String status;
  DatabaseServiceTask databaseServiceTask = new DatabaseServiceTask();
  AuthService authService = new AuthService();
  DocumentSnapshot snapshot;

  AdminTaskList({this.status});

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: databaseServiceTask.getTasksData(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return new LinearProgressIndicator();
          return Container(
              height: 350,
              child: new ListView(children: getTaskList(snapshot, status)));
        });
  }

  getTaskList(AsyncSnapshot<QuerySnapshot> snapshot, String status) {
    return snapshot.data.documents
        .map((doc) => doc["taskStatus"] == status ? TaskCard(task: doc): Container())
        .toList();
  }
}
