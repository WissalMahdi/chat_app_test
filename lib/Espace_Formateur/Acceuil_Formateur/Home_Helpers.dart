// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, unrelated_type_equality_checks

import 'dart:io';

import 'package:chat_app_test/Chat_Messenger/Google_Signin.dart';
import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/UploadPost.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeHelpersFormateur with ChangeNotifier {
  User? userData = FirebaseAuth.instance.currentUser!;

  Widget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 51, 22, 48),
      centerTitle: true,
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        IconButton(
            onPressed: (() {
              Provider.of<UploadPostApprenant>(context, listen: false)
                  .selectPostImageType(context);
            }),
            icon: Icon(
              Icons.add_circle,
              color: Color.fromARGB(255, 241, 240, 235),
            )),
        IconButton(
            onPressed: (() {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignIn()));
            }),
            icon: Icon(
              Icons.send,
              color: Color.fromARGB(255, 241, 240, 235),
            ))
      ],
      title: RichText(
          // ignore: prefer_const_constructors
          text: TextSpan(
              text: 'My',
              // ignore: prefer_const_constructors
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
              // ignore: prefer_const_literals_to_create_immutables
              children: <TextSpan>[
            TextSpan(
                text: 'Trendy',
                style: TextStyle(
                    color: Color.fromARGB(255, 120, 59, 148),
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0))
          ])),
    );
  }

  Widget HomeBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SizedBox(
                        height: 200.0,
                        width: 200.0,
                        child: CircularProgressIndicator()),
                  );
                } else {
                  return loadPosts(context, snapshot);
                }
              }),
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 12, 2, 24),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0))),
        ),
      ),
    );
  }

  Widget loadPosts(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    return ListView(
        children: snapshot.data!.docs.map((DocumentSnapshot documentSnapshot) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1654796572930-2cfe46670b2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Text(
                            Provider.of<UploadPostApprenant>(context,
                                    listen: false)
                                .captionController
                                .text,
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          )),
                          Container(
                              child: RichText(
                                  text: TextSpan(
                                      // text: userData!.email,
                                      text: 'Wissal Mahdi',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                TextSpan(
                                    text: ' , 12 hours ago',
                                    style: TextStyle(
                                        color:
                                            Colors.lightBlue.withOpacity(0.8)))
                              ])))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.46,
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                  child: Image.network(
                      'https://images.unsplash.com/photo-1654796572930-2cfe46670b2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 80.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.heart_broken_outlined,
                              color: Colors.red,
                              size: 22.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '0',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 80.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.comment,
                              color: Colors.blue,
                              size: 22.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '0',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            /* Spacer(),
            RegistrationServices().getCurrentUID() == userData!.uid
                ? IconButton(
                    onPressed: (() {}),
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ))
                : Container(
                    width: 0.0,
                    height: 0.0,
                  )*/
          ],
        ),
      );
    }).toList());
  }
}
