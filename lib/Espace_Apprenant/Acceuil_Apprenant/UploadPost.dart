// ignore_for_file: deprecated_member_use, non_constant_identifier_names, sized_box_for_whitespace, avoid_print, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPostApprenant with ChangeNotifier {
  User? userData = FirebaseAuth.instance.currentUser!;

  TextEditingController captionController = TextEditingController();
  File? uploadPostImage;
  File get getUploadPostImage => uploadPostImage!;
  String? uploadPostImageUrl;
  String get getUploadPostImageUrl => uploadPostImageUrl!;
  final picker = ImagePicker();
  UploadTask? imagePostUploadTask;

  Future uploadPostData(String postId, dynamic data) async {
    return FirebaseFirestore.instance.collection('posts').doc(postId).set(data);
  }

  Future pickUploadPostImage(BuildContext context, ImageSource source) async {
    final uploadPostImageVal = await picker.getImage(source: source);
    uploadPostImageVal == null
        ? print('Select image')
        : uploadPostImage = File(uploadPostImageVal.path);
    print(uploadPostImageVal!.path);

    uploadPostImage != null
        ? ShowPostImage(context)
        : print('Image uploaded error');

    notifyListeners();
  }

  Future uploadPostImageToFirebase() async {
    Reference imageReference = FirebaseStorage.instance
        .ref()
        .child('posts/${uploadPostImage!.path}/${TimeOfDay.now()}');
    imagePostUploadTask = imageReference.putFile(uploadPostImage!);
    await imagePostUploadTask!.whenComplete(() {
      print('Post image uploaded to storage');
    });
    imageReference.getDownloadURL().then((imageUrl) {
      uploadPostImageUrl = imageUrl;
      print(uploadPostImageUrl);
    });
    notifyListeners();
  }

  selectPostImageType(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 81, 90, 214),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  // ignore: prefer_const_constructors
                  child: Divider(
                    thickness: 4.0,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    MaterialButton(
                        color: Color.fromARGB(255, 255, 255, 255),
                        // ignore: unnecessary_const
                        child: const Text(
                          'Gallery',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Color.fromARGB(255, 1, 11, 94),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        onPressed: () {
                          pickUploadPostImage(context, ImageSource.gallery);
                        }),
                    // ignore: prefer_const_constructors
                    MaterialButton(
                        color: Color.fromARGB(255, 255, 255, 255),
                        // ignore: unnecessary_const
                        child: const Text(
                          'Camera',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Color.fromARGB(255, 1, 11, 94),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        onPressed: () {
                          pickUploadPostImage(context, ImageSource.camera);
                        }),
                  ],
                )
              ],
            ),
          );
        });
  }

  ShowPostImage(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 81, 90, 214),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  // ignore: prefer_const_constructors
                  child: Divider(
                    thickness: 4.0,
                    color: Colors.white,
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Container(
                    height: 200.0,
                    width: 400.0,
                    child: Image.file(uploadPostImage!, fit: BoxFit.contain),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Reselect',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white),
                        ),
                        onPressed: (() {
                          selectPostImageType(context);
                        }),
                      ),
                      MaterialButton(
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Confirm image',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white),
                        ),
                        onPressed: (() {
                          uploadPostImageToFirebase().whenComplete(() {
                            //  editPostSheet(context);
                            print('Image uploaded');
                          });
                        }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
