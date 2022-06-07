// ignore_for_file: file_names, prefer_const_constructors

import 'package:chat_app_test/Chat_Messenger/Google_Signin.dart';
import 'package:flutter/material.dart';

class HomeHelpers with ChangeNotifier {
  Widget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 51, 22, 48),
      centerTitle: true,
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        IconButton(
            onPressed: (() {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignIn()));
            }),
            icon: Icon(
              Icons.messenger,
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
}
