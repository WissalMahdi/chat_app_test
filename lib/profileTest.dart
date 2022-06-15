// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'services/registration.dart';

class Apprenant extends StatefulWidget {
  const Apprenant({Key? key}) : super(key: key);

  @override
  State<Apprenant> createState() => _ApprenantState();
}

class _ApprenantState extends State<Apprenant> {
  final db = FirebaseFirestore.instance;
  final UserCurrent = RegistrationServices().getCurrentUser();
  String name = "name loading..";
  String email = "name loading..";
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? myName, myUserName, myEmail;

  /*void getData() async {
    User user = await FirebaseAuth.instance.currentUser!;

    var vari = await FirebaseFirestore.instance
        .collection("Apprenants")
        .doc(user.uid)
        .get();

    setState(() {
      name = vari['FullName'];
      email = vari['Email'];
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }*/
  User? user;
  String? displayName;

  Future<void> inputData() async {
    User? userData = FirebaseAuth.instance.currentUser!;
    setState(() {
      user = userData;
      print(userData.displayName);
      print(userData.email);
    });

    // here you write the codes to input the data into firestore
  }

  @override
  void initState() {
    inputData();
    super.initState();
  }

  /* getMyInfoFromSharedPreference() async {
    myName = await SharedPreferenceHelper().getDisplayName();

    //  myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Text('email is : ${user?.email}'),

            Text('Name is :  ${user?.displayName}'),
            //Text(name),
            // Text(email),
          ],
        ),
      ),
      /*   body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('Apprenants').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // ignore: prefer_const_constructors
            return Center(
              child: const CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Card(
                  child: ListTile(
                    title: Text(doc['FullName']),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),*/
    );
  }

  //firebaseUser = FirebaseAuth.instance.currentUser!.uid;

}


             // Sized Box
                               
