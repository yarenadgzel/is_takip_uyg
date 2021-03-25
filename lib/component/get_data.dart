
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        print(snapshot.hasData);
        if (!snapshot.hasData) return new Text('Loading...');
        return Text("aaaaa");
      },
    );
  }
}
