// ignore_for_file: prefer_const_constructors

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../UI_Espace_Formateur.dart';
import 'Courses_Files_Page.dart';

void main() {
  runApp(MyApp());
}

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courses',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 2, 5, 8),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 80, 77, 80),
          title: Text(
            "Courses",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 25,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => EspaceFormateur()));
              }),
        ),
        body: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 88, 85, 77),
                child: ListTile(
                  minVerticalPadding: 25,
                  title: Text("Maintenance Industrielle (MID)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 75, 64, 74),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("1??re Ann??e MID",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => FilesPage(
                              files: const [],
                              onOpenedFile: (PlatformFile value) {},
                            )));
                  },
                )),
            const Divider(
              color: Color.fromARGB(255, 233, 229, 229),
              thickness: 1.5,
              indent: 50,
              endIndent: 50,
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(
                    255, 88, 85, 77), //  margin: EdgeInsets.all(10),
                child: ListTile(
                  minVerticalPadding: 25,
                  title: Text("Electricit?? Et Maintenance (EM)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 75, 64, 74),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("3??me Ann??e EM",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => FilesPage(
                              files: const [],
                              onOpenedFile: (PlatformFile value) {},
                            )));
                  },
                )),
            const Divider(
              color: Color.fromARGB(255, 233, 229, 229),
              thickness: 1.5,
              indent: 50,
              endIndent: 50,
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(
                    255, 88, 85, 77), //  margin: EdgeInsets.all(10),
                child: ListTile(
                  minVerticalPadding: 25,
                  title: Text("Climatisation Et Plomberie (CEP)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 139, 122, 100),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("2??me Ann??e CEP",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => FilesPage(
                              files: const [],
                              onOpenedFile: (PlatformFile value) {},
                            )));
                  },
                )),
            const Divider(
              color: Color.fromARGB(255, 233, 229, 229),
              thickness: 1.5,
              indent: 50,
              endIndent: 50,
            ),
          ],
          padding: EdgeInsets.only(top: 20),
          shrinkWrap: true,
          // itemExtent: 50,
        ));
  }
}
