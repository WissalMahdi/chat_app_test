// ignore_for_file: prefer_const_constructors

import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/Draw_Menu/Courses/course.dart';
import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/Draw_Menu/Events_And_Training/Events_Calendar.dart';
import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/Draw_Menu/Grades/Grades.dart';
import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/Draw_Menu/Results/Results.dart';
import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/Draw_Menu/Schedule_Time/Time_Schedule.dart';
import 'package:chat_app_test/Espace_Apprenant/Profile_Apprenant/ProfileApprenant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Services/Auth.dart';
import '../../SplashScreen/splash_screen.dart';

import 'Draw_Menu/Schedule_Time/Time_Schedule.dart';
import 'Home_Helpers.dart';

// ignore: use_key_in_widget_constructors
class HomeApprenant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 185, 209),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Provider.of<HomeHelpersApprenant>(context, listen: false)
            .appBar(context),
      ),
      body: Provider.of<HomeHelpersApprenant>(context, listen: false)
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
        color: Color.fromARGB(255, 48, 117, 182),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ProfileApprenant()));
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
            child: Column(
              children: const [
                CircleAvatar(
                  backgroundColor: Color(0xffE6E6E6),
                  radius: 52.0,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1615813967515-e1838c1c5116?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Karim Bani',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'karimbani@gmail.com',
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
              title: const Text('My Grades ',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Grades()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.grade_outlined),
              title: const Text(
                'My Result',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Results()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.tab_outlined),
              title: const Text('My Time Schedule',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => TimeSchedule()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.collections_outlined),
              title: const Text('My Courses',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => courses()));
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
                        backgroundColor: Color.fromARGB(255, 1, 14, 73),
                        title: Text('Log Out Of TikTalk?',
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
                            color: Color.fromARGB(255, 202, 211, 238),
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                color: Color.fromARGB(255, 5, 0, 78),
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
