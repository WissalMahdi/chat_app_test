// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

class RegistrationServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // GET CURRENT USER
  getCurrentUser() async {
    return _auth.currentUser;
  }

// GET UID
  Future<String> getCurrentUID() async {
    return (_auth.currentUser!).uid;
  }

  Future signInAnonymously() {
    return _auth.signInAnonymously();
  }

  Future createNewUser(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
    }
  }
}
