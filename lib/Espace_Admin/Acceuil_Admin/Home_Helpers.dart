// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, unrelated_type_equality_checks, deprecated_member_use, unused_element, duplicate_ignore

import 'package:chat_app_test/Chat_Messenger/Google_Signin.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import '../Profile_Admin/ProfilAdmin.dart';
import 'UploadPost.dart';
import 'feedBox.dart';

class HomeHelpers with ChangeNotifier {
  TextEditingController captionController = TextEditingController();
  late String title;
  String text = "";

  void _setText() {
    text = title;
  }

  void _clearAll() {
    captionController.text = "";
  }

  Color bgBlack = Color(0xFF1a1a1a);
  Color mainBlack = Color(0xFF262626);
  Color fbBlue = Color(0xFF2D88FF);
  Color mainGrey = Color(0xFF505050);

  //Here I'm going to import a list of images that we will use for the profile picture
  List<String> avatarUrl = [
    "https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg",
    "https://images.unsplash.com/photo-1615813967515-e1838c1c5116?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1580129958612-df668f211604?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
    "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    //--women--//
    "https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
  ];
  List<String> storyUrl = [
    "https://images.unsplash.com/photo-1553873002-785d775854c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1517420704952-d9f39e95b43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1503791774117-08c379dd7f7c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1154&q=80",
    "https://images.unsplash.com/photo-1607472586893-edb57bdc0e39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80",
    "https://images.unsplash.com/photo-1454988501794-2992f706932e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80",
    "https://images.unsplash.com/photo-1517420704952-d9f39e95b43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  ];
  Widget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 48, 117, 182),
      centerTitle: true,
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        IconButton(
            onPressed: (() {
              Provider.of<UploadPost>(context, listen: false)
                  .selectPostImageType(context);
            }),
            icon: Icon(
              Icons.add_circle,
              color: Color.fromARGB(255, 241, 240, 235),
            )),
        IconButton(
            onPressed: (() {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignIn()));
            }),
            icon: Icon(
              Icons.send,
              color: Color.fromARGB(255, 241, 240, 235),
            ))
      ],
      title: RichText(
          // ignore: prefer_const_constructors
          text: TextSpan(
              text: 'Tik',
              // ignore: prefer_const_constructors
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
              // ignore: prefer_const_literals_to_create_immutables
              children: <TextSpan>[
            TextSpan(
                text: 'Talk',
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 4, 114),
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0))
          ])),
    );
  }

  Widget HomeBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //First of all we need to creat the post editor
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 244, 247),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => ProfileAdmin()));
                          },
                          child: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage(avatarUrl[0]),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: TextField(
                            onTap: () {
                              AddPostSheet(context);
                            },
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Color.fromARGB(255, 3, 3, 3),
                            ),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 25.0),
                                hintText: "Post something...",
                                filled: true,
                                fillColor: Color.fromARGB(255, 187, 201, 218),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ignore: prefer_const_constructors
            SizedBox(
              height: 10.0,
            ),
            //Now let's create the news feed
            //first we will make the custom container of the feed
            //Ok let's test our widget
            feedBox(
                avatarUrl[0],
                "CFM_Nabeul",
                "1 j",
                "Bonjour à tous, Vos emplois du temps sera disponible dès maintenant pour l'année 2022/2023.",
                ""),
            feedBox(
                avatarUrl[3],
                "Mr.Ahmed Bousetta",
                "2 h",
                "Je Serai absent toute la semaine, on va faire un rattrapage dès que possible",
                ""),
            feedBox(
                avatarUrl[0],
                "CFM_Nabeul",
                "9 h",
                " un événement sera programmé sur 3 jours pour la semaine prochaine, vous pouvez le trouver dans les événements disponibless ",
                ""),
            feedBox(
                avatarUrl[4],
                "Mr.Riadh Hajji",
                "9 h",
                " Classe EM31, vous devez préparez le TP d'electrique (Compte rendu et simulation) pour la semaine prochaine(c'est noté) ",
                storyUrl[5]),

            feedBox(avatarUrl[6], "Mr.Mouhamed_Becha", "50 min",
                "Classe EM1 vous pouvez trouvez vos cours dés maintenant", ""),
            feedBox(
                avatarUrl[7],
                "Mm.Amel_Hamdi",
                "14 h",
                "il ya un multimétre disparu,est ce que quelqu'un de vous trouve-il",
                storyUrl[0]),
            feedBox(
                avatarUrl[1],
                "Karim Bani",
                "Yesterday",
                "Bonsoir, Est-ce que l'un de vous a trouvé une carte d'identité svp ",
                ""),
            feedBox(avatarUrl[2], "M.Saber_HJ", "1 h",
                "y a pas du cours mécanique le 25-10-2022", storyUrl[2]),
            feedBox(avatarUrl[1], "M.Amine_Hamdi", "à l'instant", text, ""),
          ],
        ),
      ),
    );
  }

  AddPostSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 200.0),
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
                                  Icons.fit_screen,
                                  color: Color.fromARGB(255, 17, 100, 155),
                                )),
                          ],
                        ),
                      ),
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
                            onChanged: (value) => title = value,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    'Share',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  onPressed: (() async {
                    _setText();
                  }),
                  color: Color.fromARGB(255, 8, 37, 199),
                ),
                // Text(text),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 187, 201, 218),
                borderRadius: BorderRadius.circular(12.0)),
          );
        });
  }
}
