import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/services/database_service.dart';

class GetDataList extends StatelessWidget {
  DatabaseService databaseService=new DatabaseService();
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return new Text("Loading");
          return Container(
              height: 350,
              child: new ListView(children: getDataList(snapshot)));
        });
  }

  getDataList(AsyncSnapshot<QuerySnapshot> snapshot) {
    snapshot.data.documents.map((e) {
      e.documentID;
    });
    return snapshot.data.documents
        .map(
          (doc) => new ListTile(
            title: new Text(doc["name"] + " " + doc["lastName"].toString()),
            subtitle: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    databaseService.deleteUserByID(doc.documentID);
                  },
                ),
              ],
            ),
          ),
        )
        .toList();
  }
}
