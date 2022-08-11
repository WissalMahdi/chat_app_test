// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireBaseOperations with ChangeNotifier {
  String? initUserEmail, initUserName;
  String get getInitUserName => initUserName!;
  String get getInitUserEmail => initUserEmail!;
  User? userData = FirebaseAuth.instance.currentUser!;

  Future<void> initUserData(BuildContext context) async {
    User? userData = FirebaseAuth.instance.currentUser!;
    initUserName = userData.displayName;
    initUserEmail = userData.email;
    print(initUserName);
    print(initUserEmail);
    notifyListeners();
  }
}
