import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:is_takip_uyg/models/Demand.dart';
import 'package:is_takip_uyg/services/auth_service.dart';

class DatabaseServiceDemand{
  final CollectionReference demandsRef = Firestore.instance.collection("demands");
  AuthService authService=new AuthService();

  createDemand(Demand demand) async {
    FirebaseUser user =await authService.getCurrentUser();
    await demandsRef.document(demand.demandID).setData(
        demand.toJson()
    );
  }
  updateDemand(Demand demand) async {
    await demandsRef.document(demand.demandID).updateData(
        demand.toJson()
    );
  }
  deleteDemand(Demand demand) async {
    await demandsRef.document(demand.demandID).delete();
  }
  getDemandData() {
    return demandsRef.snapshots();
  }

  Future saveDemand(Demand demand) async {
    await demandsRef
        .document(demand.demandID)
        .setData(demand.toJson());
  }

}