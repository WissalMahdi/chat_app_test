// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireBaseOperations with ChangeNotifier {
  String? initUserEmail, initUserName;
  String get getInitUserName => initUserName!;
  String get getInitUserEmail => initUserEmail!;

  Future initUserData(String ApprenantID) async {
    return FirebaseFirestore.instance
        .collection('Apprenants')
        .doc(ApprenantID)
        .get()
        .then((Document) {
      print('Fetching user data');
      initUserName = Document.data()!['username'];
      initUserName = Document.data()!['useremail'];
      print(initUserName);
      print(initUserEmail);
      notifyListeners();
    });
  }
}
