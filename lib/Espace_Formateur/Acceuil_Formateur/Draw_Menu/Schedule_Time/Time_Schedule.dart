// ignore_for_file: prefer_const_constructors

import 'package:chat_app_test/Espace_Formateur/Acceuil_Formateur/UI_Espace_Formateur.dart';
import 'package:flutter/material.dart';

class TimeSchedule extends StatefulWidget {
  const TimeSchedule({Key? key}) : super(key: key);

  @override
  State<TimeSchedule> createState() => _fileState();
}

class _fileState extends State<TimeSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 167, 161, 161),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 61, 17, 55),
        title: const Text('Emploi du temps TMMSI'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const EspaceFormateur()));
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 16, right: 16),
        child: Column(
          children: [
            InteractiveViewer(
              panEnabled: false,
              boundaryMargin: const EdgeInsets.all(16),
              minScale: 0.5,
              maxScale: 2,
              child: Image.asset(
                'assets/emploi.jpg',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Emploi du temps 2éme semaine',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 30,
            ),
            InteractiveViewer(
                panEnabled: false,
                boundaryMargin: const EdgeInsets.all(16),
                minScale: 0.5,
                maxScale: 2,
                child: Image.asset(
                  'assets/emploi.jpg',
                )),
          ],
        ),
      ),
    );
  }
}
