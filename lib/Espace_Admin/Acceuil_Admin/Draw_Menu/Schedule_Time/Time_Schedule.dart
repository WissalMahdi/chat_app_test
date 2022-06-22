// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../UI_Espace_Admin.dart';
import 'Schedule_Files_Page.dart';

void main() => runApp(MyApp());

class TimeSchedule extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyGridScreen(),
    );
  }
}

class MyGridScreen extends StatefulWidget {
  const MyGridScreen({Key? key}) : super(key: key);

  @override
  _MyGridScreenState createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 40, 40),
      appBar: AppBar(
        title: Text("Time Schedule"),
        backgroundColor: Color.fromARGB(255, 83, 87, 83),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 25,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => EspaceAdmin()));
            }),
      ),
      body: Center(
          child: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        maxCrossAxisExtent: 100.0,
        children: <Widget>[
          Container(
            // margin: EdgeInsets.all(10),
            padding: const EdgeInsets.all(8),
            child: Align(
                alignment: Alignment.center,
                child: const Text('MID',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 245, 248, 248)))),
            color: Color.fromARGB(255, 58, 133, 136),
          ),
          Container(
            //  margin: EdgeInsets.all(10),
            padding: const EdgeInsets.all(8),
            child: Align(
                alignment: Alignment.center,
                child: const Text('EM',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 245, 248, 248)))),
            color: Color.fromARGB(255, 129, 205, 209),
          ),
          Container(
            // margin: EdgeInsets.all(10),
            padding: const EdgeInsets.all(8),
            child: Align(
                alignment: Alignment.center,
                child: const Text('CEP',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 245, 248, 248)))),
            color: Color.fromARGB(255, 26, 99, 102),
          ),
          InkWell(
            onTap: (() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScheduleFilePage(
                          files: const [],
                          onOpenedFile: (PlatformFile value) {},
                        )))),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.center,
                  child: const Text('1er MID',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 245, 248, 248)))),
              color: Color.fromARGB(255, 124, 205, 207),
            ),
          ),
          InkWell(
            onTap: (() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScheduleFilePage(
                          files: const [],
                          onOpenedFile: (PlatformFile value) {},
                        )))),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.center,
                  child: const Text('1er EM',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 245, 248, 248)))),
              color: Color.fromARGB(255, 31, 98, 100),
            ),
          ),
          InkWell(
            onTap: (() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScheduleFilePage(
                          files: const [],
                          onOpenedFile: (PlatformFile value) {},
                        )))),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.center,
                  child: const Text('1er CEP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 245, 248, 248)))),
              color: Color.fromARGB(255, 71, 168, 172),
            ),
          ),
          InkWell(
            onTap: (() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScheduleFilePage(
                          files: const [],
                          onOpenedFile: (PlatformFile value) {},
                        )))),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.center,
                  child: const Text('2éme MID',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 245, 248, 248)))),
              color: Color.fromARGB(255, 124, 205, 207),
            ),
          ),
          InkWell(
            onTap: (() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScheduleFilePage(
                          files: const [],
                          onOpenedFile: (PlatformFile value) {},
                        )))),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.center,
                  child: const Text('2éme EM',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 245, 248, 248)))),
              color: Color.fromARGB(255, 31, 98, 100),
            ),
          ),
          InkWell(
            onTap: (() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScheduleFilePage(
                          files: const [],
                          onOpenedFile: (PlatformFile value) {},
                        )))),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.center,
                  child: const Text('2éme CEP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 245, 248, 248)))),
              color: Color.fromARGB(255, 71, 168, 172),
            ),
          ),
          InkWell(
            onTap: (() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScheduleFilePage(
                          files: const [],
                          onOpenedFile: (PlatformFile value) {},
                        )))),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.center,
                  child: const Text('3éme MID',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 245, 248, 248)))),
              color: Color.fromARGB(255, 7, 79, 80),
            ),
          ),
          InkWell(
            onTap: (() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScheduleFilePage(
                          files: const [],
                          onOpenedFile: (PlatformFile value) {},
                        )))),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.center,
                  child: const Text('3éme EM',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 245, 248, 248)))),
              color: Color.fromARGB(255, 102, 176, 179),
            ),
          ),
          InkWell(
            onTap: (() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScheduleFilePage(
                          files: const [],
                          onOpenedFile: (PlatformFile value) {},
                        )))),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.center,
                  child: const Text('3éme CEP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 245, 248, 248)))),
              color: Color.fromARGB(255, 65, 158, 161),
            ),
          ),
          InkWell(
            onTap: (() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScheduleFilePage(
                          files: const [],
                          onOpenedFile: (PlatformFile value) {},
                        )))),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.center,
                  child: const Text('4éme MID',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 245, 248, 248)))),
              color: Color.fromARGB(255, 124, 205, 207),
            ),
          ),
          InkWell(
            onTap: (() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScheduleFilePage(
                          files: const [],
                          onOpenedFile: (PlatformFile value) {},
                        )))),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.center,
                  child: const Text('4éme EM',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 245, 248, 248)))),
              color: Color.fromARGB(255, 31, 98, 100),
            ),
          ),
          InkWell(
            onTap: (() =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ScheduleFilePage(
                          files: const [],
                          onOpenedFile: (PlatformFile value) {},
                        )))),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              child: Align(
                  alignment: Alignment.center,
                  child: const Text('4éme CEP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 245, 248, 248)))),
              color: Color.fromARGB(255, 71, 168, 172),
            ),
          ),
        ],
      )),
    );
  }
}
