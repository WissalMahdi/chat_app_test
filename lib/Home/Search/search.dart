// ignore_for_file: prefer_const_constructors, avoid_types_as_parameter_names

import 'package:chat_app_test/Espace_Admin/Profile_Admin/ProfilAdmin.dart';
import 'package:chat_app_test/Home/Search/profiles.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

import 'profiles.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final controller = TextEditingController();
  List<profiles> profile = allProfiles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 27, 29),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 27, 29),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for someone..",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Color.fromARGB(255, 53, 51, 51),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none)),
              onChanged: searchProfile,
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: profile.length,
                    itemBuilder: ((context, index) {
                      final profiles = profile[index];
                      return ListTile(
                          leading: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage(
                              profiles.urlImage,
                            ),
                          ),
                          title: Text(
                            profiles.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => ProfileAdmin())));
                    })))
          ],
        ),
      ),
    );
  }

  void searchProfile(String query) {
    // ignore: unused_local_variable
    final suggestions = allProfiles.where((profiles) {
      final profileName = profiles.name.toLowerCase();
      final input = query.toLowerCase();

      return profileName.contains(input);
    }).toList();
    setState(() {
      profile = suggestions;
    });
  }
}
