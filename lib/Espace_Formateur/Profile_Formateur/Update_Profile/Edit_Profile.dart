// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:chat_app_test/Espace_Apprenant/Profile_Apprenant/ProfileApprenant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../Colors_Config/palette.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _ManageProfileState();
}

var emailController = TextEditingController();
var PasswordController = TextEditingController();
var NameController = TextEditingController();

bool _isObscure = true;
User? user = FirebaseAuth.instance.currentUser;

Future<void> editEmail() async {
  User? userData = FirebaseAuth.instance.currentUser!;
  userData.updateEmail(emailController.text.trim());
}

void _changePassword() async {
  User? user = FirebaseAuth.instance.currentUser;
  user?.updatePassword(PasswordController.text);
}

Future<void> updateDisplayName() {
  return user!.updateDisplayName(NameController.text);
}

class _ManageProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: "Change Name",
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Palette.textColor1, width: 1),
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding: const EdgeInsets.all(10)),
              controller: NameController,
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: "Change Email",
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Palette.textColor1, width: 1),
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding: const EdgeInsets.all(10)),
              controller: emailController,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  labelText: "Change Password",
                  filled: true,
                  suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Palette.textColor1, width: 1),
                      borderRadius: BorderRadius.circular(50)),
                  contentPadding: const EdgeInsets.all(10)),
              controller: PasswordController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 185, 115, 158)),
              onPressed: () {
                // if (emailController.text.isNotEmpty) {
                if (user!.displayName == null) {
                  updateDisplayName();
                  // }
                }
                if (PasswordController.text.isNotEmpty) {
                  _changePassword();
                }
                if (emailController.text.isNotEmpty) {
                  editEmail();
                }
                if (PasswordController.text.isEmpty &&
                    emailController.text.isEmpty &&
                    NameController.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('Failed'),
                            content: Text('No data to update'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'))
                            ],
                          ));
                } else if (PasswordController.text.isNotEmpty ||
                    emailController.text.isNotEmpty ||
                    NameController.text.isNotEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('Update succeeded'),
                            content: Text('Your profile was updated'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileApprenant()));
                                  },
                                  child: Text('OK'))
                            ],
                          ));
                }

                _clearAll();
              },
              child: Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }

  void _clearAll() {
    emailController.text = "";
    PasswordController.text = "";
    NameController.text = "";
  }
}
