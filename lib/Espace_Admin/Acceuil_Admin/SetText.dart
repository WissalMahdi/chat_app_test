// ignore_for_file: file_names

import "package:flutter/material.dart";

void main() => runApp(const MyAppB());

class MyAppB extends StatelessWidget {
  const MyAppB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Button(),
    );
  }
}

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Button> {
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
