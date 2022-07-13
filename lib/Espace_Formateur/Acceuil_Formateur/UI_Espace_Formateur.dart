// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names
import 'package:chat_app_test/Espace_Formateur/Profile_Formateur/ProfileFormateur.dart';

import 'package:chat_app_test/Home/Search/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HomePageHelpers.dart';
import 'Home_Formateur.dart';

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
      home: EspaceFormateur(),
    );
  }
}

class EspaceFormateur extends StatefulWidget {
  const EspaceFormateur({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<EspaceFormateur> {
  final PageController FormateurPageController = PageController();
  int pageIndeex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 52, 5, 83),
        body: PageView(
          controller: FormateurPageController,
          children: [HomeFormateur(), Search(), ProfileFormateur()],
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (page) {
            setState(() {
              pageIndeex = page;
            });
          },
        ),
        bottomNavigationBar:
            Provider.of<HomePageHelpersFormateur>(context, listen: false)
                .bottomNavBaar(pageIndeex, FormateurPageController));
  }
}
