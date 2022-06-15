// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
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

/*  Future initUserData(BuildContext context) async {
    return FirebaseFirestore.instance
        .collection('Apprenants')
        .doc()
        .get()
        .then((doc) {
      print('Fetching user data');
      initUserName = userData!.displayName;
      initUserEmail = userData!.email;
      print(initUserName);
      print(initUserEmail);
      notifyListeners();
    });
  }*/

  /* Future uploadPostData(String postId, dynamic data) async {
    return FirebaseFirestore.instance.collection('posts').doc(postId).set(data);
  }*/
}
