// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:chat_app_test/Home/Search/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Profile_Admin/ProfilAdmin.dart';
import 'HomePageHelpers.dart';
import 'Home_Admin.dart';

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
      home: EspaceAdmin(),
    );
  }
}

class EspaceAdmin extends StatefulWidget {
  const EspaceAdmin({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<EspaceAdmin> {
  final PageController adminPageController = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 52, 5, 83),
      body: PageView(
        controller: adminPageController,
        children: [HomeAdmin(), Search(), ProfileAdmin()],
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            pageIndex = page;
          });
        },
      ),
      bottomNavigationBar: Provider.of<HomePageHelpers>(context, listen: false)
          .bottomNavBar(pageIndex, adminPageController),
    );
  }
}
