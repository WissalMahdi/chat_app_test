// ignore_for_file: prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, camel_case_types

import 'package:chat_app_test/Espace_Admin/Profile_Admin/ProfilAdmin.dart';
import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/commentsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

//the feed box will have for parameters :
// the user name , the user avatar, the pub date, the content text and content img
Widget feedBoxFormateur(String avatarUrl, String userName, String date,
    String contentText, String contentImg) {
  return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Color.fromARGB(255, 238, 244, 247),
      ),
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(avatarUrl),
                      radius: 25.0,
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: (() {
                                  Get.to(ProfileAdmin());
                                }),
                                child: Text(
                                  userName,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 37, 37, 37),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              IconButton(
                                  onPressed: (() {
                                    Get.defaultDialog(title: "Alert");
                                  }),
                                  icon: Icon(
                                    Icons.person_add,
                                    size: 30,
                                  )),
                            ],
                          ),

                          // ignore: prefer_const_constructors

                          Text(
                            date,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Color.fromARGB(255, 31, 30, 30),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 10.0,
                ),
                if (contentText != "")
                  Text(
                    contentText,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 16.0),
                  ),

                SizedBox(
                  height: 10.0,
                ),
                if (contentImg != "") Image.network(contentImg),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 1.25,
                  color: Color.fromARGB(255, 161, 158, 158),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 80.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: LikeButton(
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      Icons.favorite,
                                      color: isLiked
                                          ? Color.fromARGB(255, 224, 11, 11)
                                          : Colors.grey,
                                      size: 20,
                                    );
                                  },
                                  likeCount: 1,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Like",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 15, 15, 15),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 100.0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(TestMeApp());
                                  },
                                  child: Icon(
                                    Icons.comment,
                                    color: Color.fromARGB(255, 164, 168, 172),
                                    size: 22.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Comment",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 15, 15, 15),
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                )
              ])));
}
