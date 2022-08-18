// ignore_for_file: prefer_const_constructors

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../UI_Espace_Admin.dart';
import 'Results_Files_Page.dart';

/*void main() {
  runApp(MyApp());
}*/

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
          title: Text(
            "Results",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 25,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => EspaceAdmin()));
              }),
        ),
        body: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 2, 18, 109),
                child: ListTile(
                  minVerticalPadding: 25,
                  title: Text("Maintenance Industrielle (MID)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color.fromARGB(255, 133, 156, 233),
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
                color: Color.fromARGB(255, 83, 98, 182),
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
                color: Color.fromARGB(255, 84, 93, 219),
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
                color: Color.fromARGB(255, 2, 18, 109),
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
                color: Color.fromARGB(255, 133, 156, 233),
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
                color: Color.fromARGB(255, 83, 98, 182),
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
                color: Color.fromARGB(255, 84, 93, 219),
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
                color: Color.fromARGB(255, 2, 18, 109),
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
                color: Color.fromARGB(255, 133, 156, 233),
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
                color: Color.fromARGB(255, 83, 98, 182),
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
                color: Color.fromARGB(255, 84, 93, 219),
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
