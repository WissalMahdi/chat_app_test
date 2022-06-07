// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_unnecessary_containers, use_key_in_widget_constructors, avoid_print

import 'package:chat_app_test/Espace_Apprenant/Profile_Apprenant/ProfilApprenant.dart';
import 'package:chat_app_test/SplashScreen/splash_screen.dart';
import 'package:chat_app_test/services/Auth.dart';
import 'package:chat_app_test/services/database.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import '../Espace_Apprenant/Acceuil_Apprenant/Home_Apprenant.dart';
import '../Helper_Functions_SharedPref/sharedpref_helper.dart';
import '../profileTest.dart';
import 'UI_Chat.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchUserNameEditingContoller =
      TextEditingController();
  bool isSearching = false;
  String? myName, myProfilePic, myUserName, myEmail;

  Stream? usersStream, chatRoomsStream;

  getMyInfoFromSharedPreference() async {
    myName = await SharedPreferenceHelper().getDisplayName();
    myProfilePic = await SharedPreferenceHelper().getUserProfileUrl();
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
  }

  getChatRoomIdByUsernames(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  onSearchBtnClick() async {
    isSearching = true;
    setState(() {});
    usersStream = await DatabaseMethods()
        .getUserByUserName(searchUserNameEditingContoller.text);
    setState(() {});
  }

  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRoomsStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds =
                      (snapshot.data! as QuerySnapshot).docs[index];

                  return ChatRoomListTile(
                      ds["LastMessage"], ds.id, myUserName as String);
                })
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget searchListUserTile({String? profileUrl, name, username, email}) {
    return GestureDetector(
      onTap: (() {
        // if (myUserName != null) {
        var chatRoomId = getChatRoomIdByUsernames(myUserName!, username);

        Map<String, dynamic> chatRoomInfoMap = {
          "users": [myUserName, username]
        };

        DatabaseMethods().createChatRoom(chatRoomId, chatRoomInfoMap);
        //  }

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(username, name)));
      }),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              profileUrl as String,
              height: 40,
              width: 40,
              errorBuilder: (context, exception, stackTrack) => Icon(
                Icons.error,
              ),
              loadingBuilder: (context, exception, stackTrack) =>
                  CircularProgressIndicator(),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(name), Text(email)],
          )
        ],
      ),
    );
  }

  Widget searchUsersList() {
    return StreamBuilder(
        stream: usersStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds =
                        (snapshot.data! as QuerySnapshot).docs[index];
                    return searchListUserTile(
                        profileUrl: ds["imgUrl"],
                        name: ds["name"],
                        email: ds["email"],
                        username: ds["username"]);
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }

  getChatRooms() async {
    chatRoomsStream = await DatabaseMethods().getChatRooms();
    setState(() {});
  }

  onScreenLoaded() async {
    await getMyInfoFromSharedPreference();
    getChatRooms();
  }

  @override
  void initState() {
    onScreenLoaded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 56, 52, 52),
      appBar: AppBar(
        title: Text('Messenger Clone'),
        backgroundColor: Color.fromARGB(255, 53, 51, 51),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeApprenant()));
            }),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          InkWell(
            onTap: (() {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Color.fromARGB(255, 20, 2, 18),
                      title: Text('Log Out Of Trendy?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                      actions: [
                        MaterialButton(
                          child: Text(
                            'No',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        MaterialButton(
                          color: Colors.red,
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          onPressed: () {
                            AuthMethods().singOut().then((s) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SplashScreen()));
                            });
                          },
                        )
                      ],
                    );
                  });
            }),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ProfileApprenant()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.person,
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                isSearching
                    ? GestureDetector(
                        onTap: () {
                          isSearching = false;
                          searchUserNameEditingContoller.text = "";
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Icon(Icons.arrow_back),
                        ),
                      )
                    : Container(),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(24),
                        color: Color.fromARGB(255, 233, 233, 233)),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: searchUserNameEditingContoller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search here...",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 85, 81, 81)),
                          ),
                        )),
                        GestureDetector(
                            onTap: () {
                              if (searchUserNameEditingContoller.text != "") {
                                onSearchBtnClick();
                              }
                            },
                            child: Icon(
                              Icons.person_search,
                              color: Colors.black,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            isSearching ? searchUsersList() : chatRoomsList()
          ],
        ),
      ),
    );
  }
}

class ChatRoomListTile extends StatefulWidget {
  final String lastMessage, chatRoomId, myUsername;
  const ChatRoomListTile(this.lastMessage, this.chatRoomId, this.myUsername);

  @override
  State<ChatRoomListTile> createState() => _ChatRoomListTileState();
}

class _ChatRoomListTileState extends State<ChatRoomListTile> {
  String profilePicUrl = "", name = "", username = "";
  getThisUserInfo() async {
    username =
        widget.chatRoomId.replaceAll(widget.myUsername, "").replaceAll("_", "");
    QuerySnapshot querySnapshot = await DatabaseMethods().getUserInfo(username);

    //if (querySnapshot.size > 1) {
    print(
        "something bla bla ${querySnapshot.docs[0].id} ${querySnapshot.docs[0]["name"]}");

    name = "${querySnapshot.docs[0]["name"]}";
    // }
    profilePicUrl = "${querySnapshot.docs[0]["imgUrl"]}";
    setState(() {});
  }

  @override
  void initState() {
    getThisUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(username, name)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: profilePicUrl != ""
                  ? Image.network(
                      profilePicUrl,
                      height: 40,
                      width: 40,
                    )
                  : Container(),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  widget.lastMessage,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
