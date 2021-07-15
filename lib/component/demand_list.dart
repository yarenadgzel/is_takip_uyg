import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/models/LoggedInUser.dart';
import 'package:is_takip_uyg/services/demand/database_service_demand.dart';
import 'package:provider/provider.dart';

import 'demand_card.dart';

class DemandList extends StatelessWidget {
  DocumentSnapshot snapshot;
  DatabaseServiceDemand databaseServiceDemand = new DatabaseServiceDemand();
  final CollectionReference demandsRef =
      Firestore.instance.collection("demands");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: databaseServiceDemand.getDemandData(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return Container(
              height: 550,
              child: new ListView(children: getDemandList(snapshot, context)));
        });
  }

  getDemandList(AsyncSnapshot<QuerySnapshot> snapshot, BuildContext context) {
    final loggedInUser = Provider.of<LoggedInUser>(context);
    return snapshot.data.documents
        .map(
          (doc) => doc["createrID"] == loggedInUser.uid &&
                  doc["status"] == demandStatusWaitingApprove
              ? DemandCard(
                  person: "user",
                  demand: doc.data,
                  color: Color(0xbfeb9052),
                  icon: Icons.update)
              : doc["createrID"] == loggedInUser.uid &&
                      doc["status"] == demandStatusReject
                  ? DemandCard(
                      person: "user",
                      demand: doc.data,
                      color: Color(0xffa3605d),
                      icon: Icons.remove_circle,
                    )
                  : doc["createrID"] == loggedInUser.uid &&
                          doc["status"] == demandStatusApprove
                      ? DemandCard(
                          person: "user",
                          demand: doc.data,
                          color: Colors.green,
                          icon: Icons.check_circle,
                        )
                      : Container(),
        )
        .toList();
  }
}
