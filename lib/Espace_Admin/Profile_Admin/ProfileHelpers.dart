// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers

import 'package:chat_app_test/profileTest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileHelpers with ChangeNotifier {
  String name = "";

  User? userData = FirebaseAuth.instance.currentUser!;

  Widget headerProfile(BuildContext context, DocumentSnapshot snapshot) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 200.0,
            width: 140.0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: (() {}),
                  child: CircleAvatar(
                    backgroundColor: Color(0xffE6E6E6),
                    radius: 60.0,
                    child: Icon(
                      Icons.person,
                      color: Color(0xffCCCCCC),
                      size: 55,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Cfm Nabeul',
                    // ' ${userData?.displayName}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    // spacing: 8.0,
                    //runSpacing: 4.0,
                    direction: Axis.vertical,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      /*  Icon(
                        Icons.email,
                        size: 18,
                        color: Color.fromARGB(255, 59, 16, 77),
                      ),*/
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        ' ${userData?.email}', maxLines: 2,

                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 200.0,
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 47, 18, 58),
                            borderRadius: BorderRadius.circular(15.0)),
                        height: 70.0,
                        width: 80.0,
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              '0',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0),
                            ),
                            Text(
                              'Followers',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 47, 18, 58),
                            borderRadius: BorderRadius.circular(15.0)),
                        height: 70.0,
                        width: 80.0,
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              '0',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0),
                            ),
                            Text(
                              'Followings',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 47, 18, 58),
                        borderRadius: BorderRadius.circular(15.0)),
                    height: 70.0,
                    width: 80.0,
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          '0',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0),
                        ),
                        Text(
                          'Posts',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget divider() {
    return Center(
      child: SizedBox(
        height: 25.0,
        width: 350.0,
        child: Divider(
          color: Color.fromARGB(255, 184, 157, 182),
        ),
      ),
    );
  }

  Widget footerProfile(BuildContext context, dynamic snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // child: Image.asset('images/test.jpg'),
        height: MediaQuery.of(context).size.height * 0.63,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 167, 152, 152).withOpacity(0.4),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }

  /* Widget middleProfile(BuildContext context, dynamic snapshot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Row(
            children: [
              TextButton(
                  onPressed: (() {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Apprenant()));
                  }),
                  child: Text('Modifier Profile'))
            ],
          ),
        )
      ],
    );*/
}
