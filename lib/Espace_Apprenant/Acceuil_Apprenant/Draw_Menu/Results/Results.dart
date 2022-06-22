// ignore_for_file: unnecessary_const, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../UI_Espace_Apprenant.dart';

void main() {
  runApp(Results());
}

class Results extends StatefulWidget {
  @override
  _TableExample createState() => _TableExample();
}

class _TableExample extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 39, 38, 38),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 102, 10, 64),
            title: const Text('Flutter Table Example'),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const EspaceApprenant()));
                }),
          ),
          body: Center(
              child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Mouhamed Becha (EI 21)',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Table(
                defaultColumnWidth: const FixedColumnWidth(250.0),
                border: TableBorder.all(
                    color: Color.fromARGB(255, 243, 241, 241),
                    style: BorderStyle.solid,
                    width: 2),
                children: [
                  TableRow(children: [
                    // ignore: prefer_const_literals_to_create_immutables
                    Column(children: [
                      const Text('Résultat',
                          style: const TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        height: 20,
                      )
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      const Text('14.6',
                          style: const TextStyle(
                              fontSize: 20.0, color: Colors.white)),
                      SizedBox(
                        height: 20,
                      )
                    ]),
                  ]),
                ],
              ),
            ),
          ]))),
    );
  }
}
