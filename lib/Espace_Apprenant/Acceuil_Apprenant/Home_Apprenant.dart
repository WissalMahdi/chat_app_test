// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../Chat_Messenger/Google_Signin.dart';

class HomeApprenant extends StatelessWidget {
  const HomeApprenant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 14, 36),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Trendy',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const SignIn()));
            },
            icon: const Icon(Icons.message),
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}
