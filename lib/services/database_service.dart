import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:is_takip_uyg/services/auth_service.dart';
import 'package:uuid/uuid.dart';

class DatabaseService {
  final CollectionReference myRef = Firestore.instance.collection("users");
  AuthService authService = new AuthService();

  Future createUserData(String name, String lastName) async {
    FirebaseUser user = await authService.getCurrentUser();
    print("user: " + user.uid);
    await myRef.document(user.uid).setData({
      'name': name,
      'lastName': lastName,
    });
  }

    createUniqueData(String name, String lastName) async {
    var uuid = Uuid(); //Uuid sınıfından bir nesne yarattık

    await myRef.document(uuid.v4()).setData({
      'name': name,
      'lastName': lastName,
    });
  }

  getUsersData() {
  Firestore.instance.collection("users").snapshots();
  //myRef.document("ds").documentID

  }

  updateUsersData(String name,String lastName) async {
    FirebaseUser user = await authService.getCurrentUser();
    await myRef.document(user.uid).updateData({
      'name': name,
      'lastName': lastName,
    });
  }
  deleteUserByID(String id) async {
    await myRef.document(id).delete();
  }
}
