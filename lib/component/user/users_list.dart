import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/services/auth_service.dart';
import 'package:is_takip_uyg/services/users/database_service_users.dart';

class UserList extends StatelessWidget {
  DatabaseServiceUsers databaseServiceUsers=new DatabaseServiceUsers();
  AuthService authService=new AuthService();
  DocumentSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: databaseServiceUsers.getUsersData(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return new Text("Loading");
          return Container(
              height: 350,
              child: new ListView(children: getUserList(snapshot)));
        });
  }

  getUserList(AsyncSnapshot<QuerySnapshot> snapshot) {
    snapshot.data.documents.map((e) {
      e.documentID;
    });
    return snapshot.data.documents
        .map(
          (doc) => new ListTile(
            onTap:(){},
            title: new Text(doc["name"] + " " + doc["lastName"].toString()),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red,),
              onPressed: () {
                databaseServiceUsers.deleteUserByID(doc.documentID);
              },
            ),
          ),
        )
        .toList();
  }

}
