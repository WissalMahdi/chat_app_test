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
          backgroundColor: Color.fromARGB(255, 214, 223, 233),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 48, 117, 182),
            title: const Text('Result Page'),
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
                'Karim Bani (EI 21)',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 11, 2, 114),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Table(
                defaultColumnWidth: const FixedColumnWidth(250.0),
                border: TableBorder.all(
                    color: Color.fromARGB(255, 4, 45, 87),
                    style: BorderStyle.solid,
                    width: 2),
                children: [
                  TableRow(children: [
                    // ignore: prefer_const_literals_to_create_immutables
                    Column(children: [
                      const Text('Result',
                          style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 20, 23, 212))),
                      SizedBox(
                        height: 20,
                      )
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      const Text('14.6',
                          style: const TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 11, 2, 114))),
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
