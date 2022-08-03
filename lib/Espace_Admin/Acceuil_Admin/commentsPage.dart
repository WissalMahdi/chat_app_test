// ignore_for_file: prefer_const_constructors

import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';

import 'UI_Espace_Admin.dart';

class TestMe extends StatefulWidget {
  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Karim Setti',
      'pic':
          'https://images.unsplash.com/photo-1564564321837-a57b7070ac4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80',
      'message': 'Daccord monsieur'
    },
    {
      'name': 'Mahdi Harbi',
      'pic':
          'https://images.unsplash.com/photo-1566492031773-4f4e44671857?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'message': 'Bien reçu monsieur'
    },
    {
      'name': 'Ameni Gharbi',
      'pic':
          'https://images.unsplash.com/photo-1579017331263-ef82f0bbc748?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80',
      'message': 'Ok monsieur, inshallah'
    },
    {
      'name': 'Soufien Cherni',
      'pic':
          'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      'message': 'Dacc monsieur'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  // ignore: unnecessary_new
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      // ignore: unnecessary_new
                      borderRadius:
                          // ignore: unnecessary_new
                          new BorderRadius.all(const Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Page"),
        backgroundColor: Color.fromARGB(255, 80, 8, 64),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => EspaceAdmin()));
            }),
      ),
      body: Container(
        child: CommentBox(
          userImage:
              "https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg",
          child: commentChild(filedata),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'CFM Nabeul',
                  'pic':
                      'https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg',
                  'message': commentController.text
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}
