// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'dart:io';

import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/Draw_Menu/Courses/pdf_api.dart';
import 'package:flutter/material.dart';

import '../../UI_Espace_Apprenant.dart';
import 'pdf_viewer_page.dart';

// ignore: camel_case_types
class courses extends StatefulWidget {
  const courses({Key? key}) : super(key: key);

  @override
  State<courses> createState() => _coursesState();
}

class _coursesState extends State<courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 235, 235),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 48, 117, 182),
          title: const Text('Courses',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => EspaceApprenant()));
              }),
        ),
        body: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            GestureDetector(
              onTap: () async {
                final url =
                    'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                final file = await PDFApi.loadNetwork(url);
                openPDF(context, file);
              },
              child: Card(
                  //color: Color.fromARGB(255, 179, 174, 174),
                  child: ListTile(
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                title: Text(
                  "Cours de Manitenance et électrique",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )),
            ),
            GestureDetector(
              onTap: () async {
                final url =
                    'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                final file = await PDFApi.loadNetwork(url);
                openPDF(context, file);
              },
              child: Card(
                  //  color: Color.fromARGB(255, 199, 195, 195),
                  child: ListTile(
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                title: Text(
                  " TP et Cours électrique Batiment",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )),
            ),
            GestureDetector(
              onTap: () async {
                final url =
                    'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                final file = await PDFApi.loadNetwork(url);
                openPDF(context, file);
              },
              child: Card(
                  //  color: Color.fromARGB(255, 199, 195, 195),
                  child: ListTile(
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                title: Text(
                  "Devoirs controles 2021",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )),
            ),
            GestureDetector(
              onTap: () async {
                final url =
                    'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                final file = await PDFApi.loadNetwork(url);
                openPDF(context, file);
              },
              child: Card(
                  //  color: Color.fromARGB(255, 199, 195, 195),
                  child: ListTile(
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                title: Text(
                  "Cours de Manitenance et électrique",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )),
            ),
            GestureDetector(
              onTap: () async {
                final url =
                    'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                final file = await PDFApi.loadNetwork(url);
                openPDF(context, file);
              },
              child: Card(
                  //  color: Color.fromARGB(255, 199, 195, 195),
                  child: ListTile(
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                title: Text(
                  "Cours Mécanique",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )),
            ),
            GestureDetector(
              onTap: () async {
                final url =
                    'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                final file = await PDFApi.loadNetwork(url);
                openPDF(context, file);
              },
              child: Card(
                  //  color: Color.fromARGB(255, 199, 195, 195),
                  child: ListTile(
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                title: Text(
                  "Cours du Français",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )),
            ),
            GestureDetector(
              onTap: () async {
                final url =
                    'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                final file = await PDFApi.loadNetwork(url);
                openPDF(context, file);
              },
              child: Card(
                  //  color: Color.fromARGB(255, 199, 195, 195),
                  child: ListTile(
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                title: Text(
                  "Cours d'anglais",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )),
            ),
            GestureDetector(
              onTap: () async {
                final url =
                    'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                final file = await PDFApi.loadNetwork(url);
                openPDF(context, file);
              },
              child: Card(
                  //  color: Color.fromARGB(255, 199, 195, 195),
                  child: ListTile(
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                title: Text(
                  "TD et TP électronique",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              )),
            ),
          ],
          shrinkWrap: true,
        ));
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
}
