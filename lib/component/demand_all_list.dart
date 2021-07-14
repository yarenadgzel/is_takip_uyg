import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'file:///D:/flutter_workspace/is_takip_uyg/lib/component/demand_card.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/models/LoggedInUser.dart';
import 'package:is_takip_uyg/services/demand/database_service_demand.dart';
import 'package:provider/provider.dart';

class DemandAllList extends StatelessWidget {
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
    return snapshot.data.documents
        .map(
          (doc) => doc["status"] == demandStatusWaitingApprove
              ? DemandCard(
                  demand: doc, color: Color(0xbfeb9052), icon: Icons.update)
              : doc["status"] == demandStatusReject
                  ? DemandCard(
                      demand: doc,
                      color: Color(0xffa3605d),
                      icon: Icons.remove_circle,
                    )
                  : doc["status"] == demandStatusApprove
                      ? DemandCard(
                          demand: doc,
                          color: Colors.green,
                          icon: Icons.remove_circle,
                        )
                      : Container(),
        )
        .toList();
  }
}
