// ignore_for_file: prefer_const_constructors

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../UI_Espace_Apprenant.dart';
import 'Results_Files_Page.dart';

void main() {
  runApp(MyApp());
}

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Results',
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
        //backgroundColor: Color.fromARGB(255, 48, 47, 44),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 80, 77, 80),
          title: Text(
            "Results",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 25,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => EspaceApprenant()));
              }),
        ),
        body: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 40, 4, 54),
                child: ListTile(
                  minVerticalPadding: 25,
                  title: Text("Maintenance Industrielle (MID)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 61, 16, 57),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("1ére Année MID",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ResultsFilesPage(
                              files: const [],
                              onOpenedFile: (PlatformFile value) {},
                            )));
                  },
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 100, 53, 100),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("2éme Année MID",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ResultsFilesPage(
                              files: const [],
                              onOpenedFile: (PlatformFile value) {},
                            )));
                  },
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 69, 28, 73),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("3éme Année MID",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ResultsFilesPage(
                              files: const [],
                              onOpenedFile: (PlatformFile value) {},
                            )));
                  },
                )),
            const Divider(
              color: Color.fromARGB(255, 5, 4, 4),
              thickness: 1.5,
              indent: 50,
              endIndent: 50,
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 40, 4, 54),
                //  margin: EdgeInsets.all(10),
                child: ListTile(
                  minVerticalPadding: 25,
                  title: Text("Electricité Et Maintenance (EM)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 61, 16, 57),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("1ére Année EM",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ResultsFilesPage(
                              files: const [],
                              onOpenedFile: (PlatformFile value) {},
                            )));
                  },
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 100, 53, 100),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("2éme Année EM",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ResultsFilesPage(
                              files: const [],
                              onOpenedFile: (PlatformFile value) {},
                            )));
                  },
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 69, 28, 73),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("3éme Année EM",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ResultsFilesPage(
                              files: const [],
                              onOpenedFile: (PlatformFile value) {},
                            )));
                  },
                )),
            const Divider(
              color: Color.fromARGB(255, 12, 11, 11),
              thickness: 1.5,
              indent: 50,
              endIndent: 50,
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 40, 4, 54),
                //  margin: EdgeInsets.all(10),
                child: ListTile(
                  minVerticalPadding: 25,
                  title: Text("Climatisation Et Plomberie (CEP)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 61, 16, 57),
                margin: EdgeInsets.all(10),
                child: ListTile(
                    title: Text("1ére Année CEP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ResultsFilesPage(
                                files: const [],
                                onOpenedFile: (PlatformFile value) {},
                              )));
                    })),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 100, 53, 100),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("2éme Année CEP",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ResultsFilesPage(
                              files: const [],
                              onOpenedFile: (PlatformFile value) {},
                            )));
                  },
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 69, 28, 73),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("3éme Année CEP",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ResultsFilesPage(
                              files: const [],
                              onOpenedFile: (PlatformFile value) {},
                            )));
                  },
                )),
            const Divider(
              color: Color.fromARGB(255, 10, 9, 9),
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
