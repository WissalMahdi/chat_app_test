// ignore_for_file: prefer_const_constructors, unused_field, unused_element, unused_local_variable

import 'dart:io';

import 'package:chat_app_test/Espace_Formateur/Profile_Formateur/ProfileFormateur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'Edit_Profile.dart';

class ProfileViewForm extends StatefulWidget {
  const ProfileViewForm({Key? key}) : super(key: key);

  @override
  State<ProfileViewForm> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileViewForm> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      // final imageTemporary = File(image.path);
      final imagePermanant = await saveImagePermanently(image.path);
      setState(() => this.image = imagePermanant);
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // ignore: prefer_const_
                // literals_to_create_immutables
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
                  Color.fromARGB(255, 5, 26, 145),
                  Color.fromARGB(255, 122, 183, 233),
                  Color.fromARGB(255, 66, 92, 240),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ProfileFormateur()));
                  },
                  icon: Icon(Icons.close),
                  padding: EdgeInsets.fromLTRB(20, 0, 400, 20),
                  iconSize: 35,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    image != null
                        ? ClipOval(
                            child: Image.file(
                            image!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ))
                        : ClipOval(
                            child: Image.network(
                            "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          )),
                    Positioned(
                        left: 95,
                        bottom: -10,
                        child: IconButton(
                          onPressed: (() => pickImage()),
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 30,
                            color: Color.fromARGB(255, 252, 252, 252),
                          ),
                        ))
                  ],
                )

                // ignore: prefer_const_constructors
              ],
            ),
          )),
          Expanded(
            flex: 1,
            child: EditProfile(),
          ),
        ],
      ),
    );
  }
}
