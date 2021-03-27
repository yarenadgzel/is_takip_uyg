import 'package:firebase_auth/firebase_auth.dart';
import 'package:is_takip_uyg/models/LoggedInUser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  LoggedInUser userFromFirebaseUser(FirebaseUser user) {
    return user != null
        ? LoggedInUser(uid: user.uid)
        : null;
  }

  // Firebase ile giriş yapmış olan kullanıcının bilgilerini döndürür
  getCurrentUser() async {
   FirebaseUser user = await _auth.currentUser();
   return user;
  }


  // ---------------------- getter ---------------------- //

  Stream<LoggedInUser> get user {
    return _auth.onAuthStateChanged.map(userFromFirebaseUser);
  }

  // ---------------------- signInWithEmailAndPassword ---------------------- //
  //Giriş işlemi yapılmasını sağlar
  Future signWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = authResult.user;
      return userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }

  }


  // ---------------------- registerWithEmailAndPassword ---------------------- //

  // Firebase'e kullanıcı kayıdı oluşturmasını sağlar.
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = authResult.user;

      return authResult.user.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  // ---------------------- signOut ---------------------- //

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}
