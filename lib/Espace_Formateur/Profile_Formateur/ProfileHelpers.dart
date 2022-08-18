// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_new, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_local_variable, avoid_print, non_constant_identifier_names

import 'dart:io';

import 'package:chat_app_test/Espace_Formateur/Acceuil_Formateur/commentsPage.dart';
import 'package:chat_app_test/Espace_Formateur/Profile_Formateur/likes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'ProfileFormateur_After_delete.dart';

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
    PhotoItem("http://www.fsjegj.rnu.tn/Fr/upload/1572960712.jpg",
        "Formation terminée avec succès merci chers éléves"),
    PhotoItem(
        "https://images.unsplash.com/photo-1553873002-785d775854c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        "Il ya un multimétre disparu,est ce que quelqu'un de vous trouve-il s'il vous plait?"),
    PhotoItem("http://www.fsjegj.rnu.tn/Fr/upload/1617869296.jpg",
        "إحياء الذكرى الخامسة والأربعين ليوم الأرض"),
    PhotoItem(
        "https://www.challenges.tn/wp-content/uploads/2018/11/UPSAT-1.jpg", ""),
    PhotoItem(
        "https://images.unsplash.com/photo-1454988501794-2992f706932e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80",
        "درس افتتاحي للسنة الجماعية 2022/2023 تحت عنوان التمييز الايجابي 25/10/2022"),
    PhotoItem(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1gx0mywIPxRtBhh8n_nCOMM5Uxex22KTj3w&usqp=CAU",
        "merci pour cette belle année messieurs et mesdames"),
    PhotoItem(
        "https://www.enicbcmed.eu/sites/default/files/styles/image_style_slider/public/2022-01/MYSEA%20tunisie_0.jpg?itok=pwMKi3wD",
        ""),
    PhotoItem("https://orientini.com/uploads/csfm_nabeul.jpg", ""),
    PhotoItem(
        "https://www.lacroixblanche.org/wp-content/uploads/2020/07/R%C3%A9sultats.jpg",
        "Vos résultats sont disponibles maintenant "),
    PhotoItem(
        "https://cck.rnu.tn/wp-content/uploads/2022/07/AO_SI-MESRS-thegem-blog-masonry.jpg",
        "Appel d'offres nationnal Aout 2022"),
    PhotoItem(
        "https://cdn-az.allevents.in/events5/banners/d8b89f57061fe1c51367dd16865f777be49c9d40dc8ad6d129f6a0ec19112d5c-rimg-w508-h720-gmir.jpg?v=1583520731",
        " حصة تثقيفية حول أبجديات الإسعافات لمجموعة من المتكونين بالمركز القطاعي للتكوين في الصيانة نابل من منظمة الهلال الأحمر الهيئة الجهوية بنابل يوم السبت 20 نوفمبر بقاعة التنشيط بالمبيت "),
    PhotoItem(
        "http://www.mon-diplome.fr/Diplome/700-332946-Diplome+de+Maintenance+Industrielle.jpg",
        "le dépôt des diplômes sera dans le mois de septembre 2022"),
    PhotoItem(
      "https://www.jeuneafrique.com/medias/2018/05/09/tunisie-universits-payantes-592x296-1525868742.jpg",
      "",
    ),
    PhotoItem(
        "https://www.tunisienumerique.com/wp-content/uploads/Photo-0134-1.jpg",
        ""),
    PhotoItem("https://wallpaperaccess.com/full/1668956.png",
        "Je Serai absent toute la semaine, on va faire un rattrapage dès que possible"),
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
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // ignore: prefer_const_literals_to_create_immutables
              colors: <Color>[
                Color.fromARGB(255, 14, 43, 173),
                Color.fromARGB(255, 135, 157, 255)
              ],
            ),
          ),
        ),
        title: Text('Post'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Delete'}.map((String choice) {
                return PopupMenuItem<String>(
                    value: choice,
                    child: GestureDetector(
                        child: Text(choice),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Color.fromARGB(255, 1, 14, 73),
                                title: Text('Delete this element?',
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
                                    color: Color.fromARGB(255, 202, 211, 238),
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 5, 0, 78),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileFormateurAfterDelete()));
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        }));
              }).toList();
            },
          ),
        ],
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
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
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
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 28,
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => likesForma()));
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "5",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
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
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CommentsFormateur()));
                            },
                            child: Icon(
                              Icons.comment,
                              color: Color.fromARGB(255, 17, 17, 17),
                              size: 28.0,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "4",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  )
                ],
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

  void handleClick(String value) {
    switch (value) {
      case 'Delete':
        break;
      case 'Update':
        break;
    }
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
                            "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
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
                            color: Colors.white,
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
                        color: Color.fromARGB(255, 2, 4, 156),
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
                            color: Color.fromARGB(255, 2, 4, 156),
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
                            color: Color.fromARGB(255, 55, 89, 236),
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
                            color: Color.fromARGB(255, 55, 89, 236),
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
                        color: Color.fromARGB(255, 55, 89, 236),
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
        width: 300.0,
        child: Divider(
          color: Color.fromARGB(255, 90, 72, 250),
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
}
