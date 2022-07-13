// ignore_for_file: prefer_const_constructors

import 'package:chat_app_test/Espace_Formateur/Acceuil_Formateur/Draw_Menu/Courses/Courses.dart';
import 'package:chat_app_test/Espace_Formateur/Acceuil_Formateur/Draw_Menu/Events_And_Training/Events_Calendar.dart';
import 'package:chat_app_test/Espace_Formateur/Acceuil_Formateur/Draw_Menu/Grades/Grades.dart';
import 'package:chat_app_test/Espace_Formateur/Acceuil_Formateur/Draw_Menu/Schedule_Time/Time_Schedule.dart';
import 'package:chat_app_test/Espace_Formateur/Profile_Formateur/ProfileFormateur.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Services/Auth.dart';
import '../../SplashScreen/splash_screen.dart';

import 'Home_Helpers.dart';

// ignore: use_key_in_widget_constructors
class HomeFormateur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 48, 48),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Provider.of<HomeHelpersFormateur>(context, listen: false)
            .appBar(context),
      ),
      body: Provider.of<HomeHelpersFormateur>(context, listen: false)
          .HomeBody(context),
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        )),
      );

  Widget buildHeader(BuildContext context) => Material(
        color: Color.fromARGB(255, 26, 2, 26),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ProfileFormateur()));
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
            child: Column(
              children: const [
                CircleAvatar(
                  backgroundColor: Color(0xffE6E6E6),
                  radius: 52.0,
                  child: Icon(
                    Icons.person,
                    color: Color(0xffCCCCCC),
                    size: 50,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'CFM Nabeul',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'cfmnabeul@gmail.com',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        child: Wrap(
// ignore: prefer_const_literals_to_create_immutables
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Events And Trainings',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => CustomTableCalendar()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.grading),
              title: const Text('Grades 2022/2023',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Grades()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.tab_outlined),
              title: const Text('Time Schedule 2022/2023',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => TimeSchedule()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.tab_outlined),
              title: const Text('Courses',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Courses()));
              },
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Log Out',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Color.fromARGB(255, 20, 2, 18),
                        title: Text('Log Out Of Trendy?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold)),
                        actions: [
                          MaterialButton(
                            child: Text(
                              'No',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          MaterialButton(
                            color: Colors.red,
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            onPressed: () {
                              AuthMethods().singOut().then((s) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SplashScreen()));
                              });
                            },
                          )
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      );
}
