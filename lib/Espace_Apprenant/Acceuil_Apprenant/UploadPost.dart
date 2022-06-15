// ignore_for_file: deprecated_member_use, non_constant_identifier_names, sized_box_for_whitespace, avoid_print, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:io';

import 'package:chat_app_test/Espace_Apprenant/Profile_Apprenant/Update_Profile/Edit_Profile.dart';
import 'package:chat_app_test/Services/fireBaseOperations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadPost with ChangeNotifier {
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
                color: Color.fromARGB(255, 49, 5, 53),
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
                        color: Colors.blue,
                        // ignore: unnecessary_const
                        child: const Text(
                          'Gallery',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        onPressed: () {
                          pickUploadPostImage(context, ImageSource.gallery);
                        }),
                    // ignore: prefer_const_constructors
                    MaterialButton(
                        color: Colors.blue,
                        // ignore: unnecessary_const
                        child: const Text(
                          'Camera',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Colors.white,
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
                color: Color.fromARGB(255, 49, 5, 53),
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
                            editPostSheet(context);
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

  editPostSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: Colors.white,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: (() {}),
                                icon: Icon(
                                  Icons.image_aspect_ratio,
                                  color: Colors.green,
                                )),
                            IconButton(
                                onPressed: (() {}),
                                icon: Icon(
                                  Icons.fit_screen,
                                  color: Colors.yellow,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: 200.0,
                        width: 300.0,
                        child: Image.file(
                          uploadPostImage!,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        height: 30.0,
                        width: 30.0,
                        child: Icon(Icons.add_to_home_screen),
                      ),
                      Container(
                        height: 110.0,
                        width: 3.0,
                        color: Color.fromARGB(255, 185, 189, 194),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: 100.0,
                          width: 300.0,
                          child: TextField(
                            maxLines: 5,
                            textCapitalization: TextCapitalization.words,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100)
                            ],
                            maxLengthEnforced: true,
                            maxLength: 100,
                            controller: captionController,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              hintText: 'Add a caption...',
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  child: Text(
                    'Share',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  onPressed: (() async {
                    uploadPostData(captionController.text, {
                      'postimage': getUploadPostImageUrl,
                      'caption': captionController.text,
                      'time': Timestamp.now(),
                      'useremail': userData!.email,
                      'username': userData!.displayName,
                      'useruid': userData!.uid,
                      'imageUrl': uploadPostImageUrl,
                    }).whenComplete(() {
                      Navigator.pop(context);
                    });
                  }),
                  color: Colors.blue,
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 52, 53, 54),
                borderRadius: BorderRadius.circular(12.0)),
          );
        });
  }
}
