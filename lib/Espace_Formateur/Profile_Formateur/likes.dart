// ignore_for_file: prefer_const_constructors

import 'package:chat_app_test/Espace_Admin/Profile_Admin/ProfilAdmin.dart';
import 'package:chat_app_test/Espace_Formateur/Profile_Formateur/ProfileFormateur.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(likesForma());
}

// ignore: camel_case_types, use_key_in_widget_constructors
class likesForma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 239, 240, 253),
        appBar: AppBar(
          title: Text("Likes"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                // ignore: prefer_const_literals_to_create_immutables
                colors: <Color>[
                  Color.fromARGB(255, 14, 43, 173),
                  Color.fromARGB(255, 135, 157, 255)
                ],
              ),
            ),
          ),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ProfileFormateur()));
              }),
        ),
        body: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Card(
                child: ListTile(
              leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ProfileAdmin()));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg"),
                ),
              ),
              title: Text("CFM Nabeul"),
            )),
            Card(
              child: ListTile(
                title: Text("Mr.Ahmed Bousetta"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1580129958612-df668f211604?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
                  ),
                ),
              ),
            ),
            Card(
                child: ListTile(
              title: Text("Mr.Riadh Hajji"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                ),
              ),
            )),
            Card(
                child: ListTile(
              title: Text("Mm.Amel_Hamdi"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
              ),
            )),
            Card(
                child: ListTile(
              title: Text("Karim Bani"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1615813967515-e1838c1c5116?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                ),
              ),
            )),
          ],
          shrinkWrap: true,
        ));
  }
}
