// ignore_for_file: file_names

import "package:flutter/material.dart";

void main() => runApp(const MyAppA());

class MyAppA extends StatelessWidget {
  const MyAppA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ButtonApp(),
    );
  }
}

class ButtonApp extends StatefulWidget {
  const ButtonApp({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ButtonApp> {
  late String title;
  String text = "";

  // ignore: unused_element
  void _setText() {
    setState(() {
      text = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold();
  }
}
