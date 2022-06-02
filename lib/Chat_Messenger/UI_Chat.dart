// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:chat_app_test/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../Helper_Functions_SharedPref/sharedpref_helper.dart';

class ChatScreen extends StatefulWidget {
  final String chatWithUsername, name;
  const ChatScreen(this.chatWithUsername, this.name);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String? chatRoomId, messageId = "";
  Stream? messageStream;
  String? myName, myProfilePic, myUserName, myEmail;
  TextEditingController messageTextEdittingController = TextEditingController();

  getMyInfoFromSharedPreference() async {
    myName = await SharedPreferenceHelper().getDisplayName();
    myProfilePic = await SharedPreferenceHelper().getUserProfileUrl();
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();

    // if (myUserName != null) {
    chatRoomId = getChatRoomIdByUsernames(widget.chatWithUsername, myUserName!);
  }
  //}

  getChatRoomIdByUsernames(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  addMessage(bool sendClicked) {
    if (messageTextEdittingController.text != "") {
      String message = messageTextEdittingController.text;
      var LastMessageTs = DateTime.now();

      Map<String, dynamic> messageInfoMap = {
        "message": message,
        "sendBy": myUserName,
        "ts": LastMessageTs,
        "imgUrl": myProfilePic
      };

      //messageId
      if (messageId == "") {
        messageId = randomAlphaNumeric(12);
      }

      DatabaseMethods()
          .addMessage(chatRoomId!, messageId!, messageInfoMap)
          .then((value) {
        Map<String, dynamic> lastMessageInfoMap = {
          "LastMessage": message,
          "LastMessageSendTs": LastMessageTs,
          "LastMessageSendBy": myUserName
        };
        DatabaseMethods()
            .updateLastMessageSend(chatRoomId!, lastMessageInfoMap);

        if (sendClicked) {
          // remove the text in the message input field
          messageTextEdittingController.text = "";
          // make message id blank to get regenrated on next message send
          messageId = "";
        }
      });
    }
  }

  Widget chatMessageTile(String message, bool sendByMe) {
    return Row(
      mainAxisAlignment:
          sendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomRight:
                      sendByMe ? Radius.circular(0) : Radius.circular(24),
                  bottomLeft:
                      sendByMe ? Radius.circular(24) : Radius.circular(0),
                  topRight: Radius.circular(24),
                ),
                color: sendByMe
                    ? Color.fromARGB(255, 166, 132, 197)
                    : Color.fromARGB(255, 238, 235, 235)),
            padding: EdgeInsets.all(16),
            child: Text(
              message,
              style: sendByMe
                  ? TextStyle(color: Colors.white)
                  : TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget chatMessages() {
    return StreamBuilder(
      stream: messageStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.only(bottom: 70, top: 16),
                itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                reverse: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds =
                      (snapshot.data! as QuerySnapshot).docs[index];
                  return chatMessageTile(
                      ds["message"], myUserName == ds["sendBy"]);
                })
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  getAndSetMessages() async {
    messageStream = await DatabaseMethods().getChatRoomMessages(chatRoomId);
    setState(() {});
  }

  doThisOnLaunch() async {
    await getMyInfoFromSharedPreference();
    getAndSetMessages();
  }

  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 26, 41),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 19, 31),
        title: Text(widget.name),
      ),
      body: Container(
          child: Stack(
        children: [
          chatMessages(),
          Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageTextEdittingController,
                        onChanged: (value) {
                          addMessage(false);
                        },
                        //style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type a message",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 30, 4, 71)
                                    .withOpacity(0.6))),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        addMessage(true);
                      },
                      child: Icon(
                        Icons.send,
                        color: Color.fromARGB(255, 83, 50, 136),
                      ),
                    )
                  ],
                ),
                //  ),
              ))
        ],
      )),
    );
  }
}
