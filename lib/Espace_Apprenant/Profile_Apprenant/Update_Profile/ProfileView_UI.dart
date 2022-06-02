// ignore_for_file: prefer_const_constructors

import 'package:chat_app_test/Espace_Apprenant/Profile_Apprenant/Update_Profile/Edit_Profile.dart';
import 'package:flutter/material.dart';

import '../ProfilApprenant.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 155, 126, 155),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ProfileApprenant()));
                  },
                  icon: Icon(Icons.close),
                  padding: EdgeInsets.only(right: 300),
                  iconSize: 35,
                  color: Colors.white,
                ),

                Stack(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xffE6E6E6),
                      radius: 60.0,
                      child: Icon(
                        Icons.person,
                        color: Color(0xffCCCCCC),
                        size: 55,
                      ),
                    ),
                    Positioned(
                        left: 75,
                        bottom: -10,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 30,
                            color: Color.fromARGB(255, 78, 76, 76),
                          ),
                        ))
                  ],
                )
                // ignore: prefer_const_constructors
              ],
            ),
          )),
          Expanded(
            flex: 2,
            child: EditProfile(),
          )
        ],
      ),
    );
  }
}
