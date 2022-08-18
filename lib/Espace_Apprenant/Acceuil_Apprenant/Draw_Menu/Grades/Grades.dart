// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../UI_Espace_Apprenant.dart';

void main() {
  runApp(Grades());
}

class Grades extends StatefulWidget {
  @override
  _DataTableExample createState() => _DataTableExample();
}

class _DataTableExample extends State<Grades> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 214, 223, 233),
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
            title: Text('Grades'),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => EspaceApprenant()));
                }),
          ),
          body: ListView(children: <Widget>[
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                'Karim Bani (EI 21)',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 11, 2, 114)),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            DataTable(
              // ignore: prefer_const_literals_to_create_immutables
              columns: [
                DataColumn(
                    label: Text('Matiére',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 22, 8, 173)))),
                DataColumn(
                    label: Text('DC',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 22, 8, 173)))),
                DataColumn(
                    label: Text('DS',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 22, 8, 173)))),
              ],
              // ignore: prefer_const_literals_to_create_immutables
              rows: [
                // ignore: prefer_const_literals_to_create_immutables
                DataRow(cells: [
                  DataCell(Text(
                    'Electricité',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text('14')),
                  DataCell(Text('11')),
                ]),
                // ignore: prefer_const_literals_to_create_immutables
                DataRow(cells: [
                  DataCell(Text('Français',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))),
                  DataCell(Text('10')),
                  DataCell(Text('6')),
                ]),
                // ignore: prefer_const_literals_to_create_immutables
                DataRow(cells: [
                  DataCell(Text('Mécanique',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))),
                  DataCell(Text('11')),
                  DataCell(Text('14')),
                ]),
                // ignore: prefer_const_literals_to_create_immutables
                DataRow(cells: [
                  DataCell(Text('Anglais',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))),
                  DataCell(Text('9')),
                  DataCell(Text('14')),
                ]),
                // ignore: prefer_const_literals_to_create_immutables
                DataRow(cells: [
                  DataCell(Text('Maintenace',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))),
                  DataCell(Text('6')),
                  DataCell(Text('10')),
                ]),
                // ignore: prefer_const_literals_to_create_immutables
                DataRow(cells: [
                  DataCell(Text('Plomberie',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))),
                  DataCell(Text('19')),
                  DataCell(Text('9')),
                ]),
                // ignore: prefer_const_literals_to_create_immutables
                DataRow(cells: [
                  DataCell(Text('Informatique',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))),
                  DataCell(Text('9')),
                  DataCell(Text('16')),
                ]),
                // ignore: prefer_const_literals_to_create_immutables
                DataRow(cells: [
                  DataCell(Text('Climatisation',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))),
                  DataCell(Text('8')),
                  DataCell(Text('10')),
                ]),
                // ignore: prefer_const_literals_to_create_immutables
                DataRow(cells: [
                  DataCell(Text('Electronique',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))),
                  DataCell(Text('15')),
                  DataCell(Text('10')),
                ]),
                // ignore: prefer_const_literals_to_create_immutables
                DataRow(cells: [
                  DataCell(Text('Embarqué',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))),
                  DataCell(Text('11')),
                  DataCell(Text('15')),
                ]),
              ],
            ),
          ])),
    );
  }
}
