// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_new, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_local_variable, avoid_print

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

void main() async {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, initialRoute: '/', routes: {
      '/': (context) => RouteOne(),
      '/detail': (context) => RouteTwo(image: '', name: ''),
    }),
  );
}

class PhotoItem {
  final String image;
  final String name;
  PhotoItem(this.image, this.name);
}

class RouteOne extends StatelessWidget {
  final List<PhotoItem> _items = [
    PhotoItem(
        "https://images.unsplash.com/photo-1553873002-785d775854c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        "Il ya un multimétre disparu,est ce que quelqu'un de vous trouve-il?"),
    PhotoItem(
        "https://images.unsplash.com/photo-1517420704952-d9f39e95b43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        "Classe EM31, vous devez préparez le TP d'electrique (Compte rendu et simulation) pour la semaine prochaine(c'est noté) "),
    PhotoItem(
        "https://images.unsplash.com/photo-1607472586893-edb57bdc0e39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80",
        "Pouvez-vous faire une installation parfaite de plomberie comme ça montre cette figure? :D"),
    PhotoItem(
        "https://images.unsplash.com/photo-1454988501794-2992f706932e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80",
        ""),
    PhotoItem(
        "https://images.unsplash.com/photo-1606676539940-12768ce0e762?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        "Si quelqu'un d'entre vous avez une perceuse, il vaut mieux qu'il l'apportait pour le TP car le nombre de perceuses qu'on a possèdé n'est pas suffisant"),
    PhotoItem(
        "https://images.unsplash.com/photo-1620332114059-c88fe9862928?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1279&q=80",
        ""),
    PhotoItem(
        "https://images.unsplash.com/photo-1544724569-5f546fd6f2b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        "ELC 22, on va réaliser une installation pour l'armoire électrique comme montre cette figure pour demain"),
    PhotoItem(
        "https://images.unsplash.com/photo-1563456019560-2b37aa7ad890?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80",
        ""),
    PhotoItem(
        "https://images.unsplash.com/photo-1517420704952-d9f39e95b43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        "Classe MID, est-ce que vous avez terminé ce TP? "),
    PhotoItem(
        "https://images.unsplash.com/photo-1517077304055-6e89abbf09b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80",
        "Classe CEP, vos cours seront disponibles dès qu'aujourd'hui"),
    PhotoItem(
        "https://images.unsplash.com/photo-1527427337751-fdca2f128ce5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        "Classe MID, N'oubliez pas de coder les exercices de Python pour la séance de demain"),
    PhotoItem(
        "https://images.unsplash.com/photo-1509390144018-eeaf65052242?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
        "Classe EM1, on a une visite à STEG'N demain à 8h30 préparer vous bien"),
    PhotoItem(
        "https://images.unsplash.com/photo-1620214819239-704eb97df587?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
        "Classe EM21, Nouvelle matiére d'energitique pour l'année prochaine"),
    PhotoItem(
        "https://images.unsplash.com/photo-1602267774924-38124c047174?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        ""),
    PhotoItem("https://wallpaperaccess.com/full/1668956.png",
        "Bonsoir, est ce que quelqu'un d'entre vous à trouver une carte d'identité s'il vous plaît?"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
        ),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RouteTwo(
                      image: _items[index].image, name: _items[index].name),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_items[index].image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RouteTwo extends StatelessWidget {
  final String image;
  final String name;

  RouteTwo({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 71, 5, 57),
        title: Text('Post'),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              child: Image(
                image: NetworkImage(image),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileHelpersFormateur with ChangeNotifier {
  File? image;
  Future pickImage() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      // final imageTemporary = File(image.path);
      final imagePermanant = await saveImagePermanently(image.path);
      //setState(() => this.image = imagePermanant  );

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

  String name = "";

  User? userData = FirebaseAuth.instance.currentUser!;

  Widget headerProfile(BuildContext context, DocumentSnapshot snapshot) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 200.0,
            width: 140.0,
            child: Column(
              children: [
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
                            "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          )),
                    Positioned(
                        left: 80,
                        bottom: -10,
                        child: IconButton(
                          onPressed: (() => pickImage()),
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 30,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Riadh Hajji',
                    // ' ${userData?.displayName}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    // spacing: 8.0,
                    //runSpacing: 4.0,
                    direction: Axis.vertical,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      /*  Icon(
                        Icons.email,
                        size: 18,
                        color: Color.fromARGB(255, 59, 16, 77),
                      ),*/
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        ' ${userData?.email}', maxLines: 2,

                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 200.0,
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 47, 18, 58),
                            borderRadius: BorderRadius.circular(15.0)),
                        height: 70.0,
                        width: 80.0,
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              '15',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0),
                            ),
                            Text(
                              'Followers',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 47, 18, 58),
                            borderRadius: BorderRadius.circular(15.0)),
                        height: 70.0,
                        width: 80.0,
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              '10',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0),
                            ),
                            Text(
                              'Followings',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 47, 18, 58),
                        borderRadius: BorderRadius.circular(15.0)),
                    height: 70.0,
                    width: 80.0,
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          '20',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0),
                        ),
                        Text(
                          'Posts',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget divider() {
    return Center(
      child: SizedBox(
        height: 25.0,
        width: 350.0,
        child: Divider(
          color: Color.fromARGB(255, 184, 157, 182),
        ),
      ),
    );
  }

  Widget footerProfile(BuildContext context, dynamic snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: RouteOne(),

            //child: Image.asset('images/test.jpg'),
            height: MediaQuery.of(context).size.height * 0.63,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 167, 152, 152).withOpacity(0.4),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ],
      ),
    );
  }

  /* Widget middleProfile(BuildContext context, dynamic snapshot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Row(
            children: [
              TextButton(
                  onPressed: (() {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Apprenant()));
                  }),
                  child: Text('Modifier Profile'))
            ],
          ),
        )
      ],
    );*/
}
