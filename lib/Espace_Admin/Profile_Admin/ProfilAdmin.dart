// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Acceuil_Admin/UI_Espace_Admin.dart';
import 'ProfileHelpers.dart';
import 'Update_Profile/ProfileView_UI.dart';

class ProfileAdmin extends StatelessWidget {
  const ProfileAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => EspaceAdmin()));
            }),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Color.fromARGB(255, 254, 255, 254),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ProfileView()));
            },
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // ignore: prefer_const_literals_to_create_immutables
              colors: <Color>[
                Color.fromARGB(255, 14, 43, 173),
                Color.fromARGB(255, 135, 157, 255)
              ],
            ),
          ),
        ),
        title: RichText(
            text: TextSpan(
                text: 'My',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
                children: <TextSpan>[
              TextSpan(
                  text: 'Profile',
                  style: TextStyle(
                      color: Color.fromARGB(255, 21, 1, 110),
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0))
            ])),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Admin')
                .doc()
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return new Column(
                  children: [
                    Provider.of<ProfileHelpers>(context, listen: false)
                        .headerProfile(
                            context, snapshot.data as DocumentSnapshot),
                    //    Provider.of<ProfileHelpers>(context, listen: false)
                    //      .middleProfile(context, snapshot),
                    Provider.of<ProfileHelpers>(context, listen: false)
                        .divider(),
                    Provider.of<ProfileHelpers>(context, listen: false)
                        .footerProfile(context, snapshot)
                  ],
                );
              }
            },
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Color.fromARGB(255, 197, 208, 238)),
        ),
      )),
    );
  }
}
