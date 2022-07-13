// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/Home_Apprenant.dart';
import 'package:chat_app_test/Espace_Apprenant/Profile_Apprenant/ProfileApprenant.dart';

import 'package:chat_app_test/Home/Search/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HomePageHelpers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Espace Apprenant',
      home: EspaceApprenant(),
    );
  }
}

class EspaceApprenant extends StatefulWidget {
  const EspaceApprenant({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<EspaceApprenant> {
  final PageController apprenantPageController = PageController();
  int pageIndeex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 52, 5, 83),
        body: PageView(
          controller: apprenantPageController,
          children: [HomeApprenant(), Search(), ProfileApprenant()],
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (page) {
            setState(() {
              pageIndeex = page;
            });
          },
        ),
        bottomNavigationBar:
            Provider.of<HomePageHelpersApprenant>(context, listen: false)
                .bottomNavBaar(pageIndeex, apprenantPageController));
  }
}
