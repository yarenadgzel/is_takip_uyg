import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:is_takip_uyg/services/auth_service.dart';

class DatabaseService{

  final CollectionReference myRef=Firestore.instance.collection("users");
  AuthService authService = new AuthService();

  Future createUserData(String name,String lastName) async{
    FirebaseUser user = await authService.getCurrentUser();
    print("user: "+ user.uid);
    await myRef.document(user.uid).setData({
      'name':name,
      'lastName':lastName,
    });
  }

}