// ignore_for_file: prefer_const_constructors, avoid_types_as_parameter_names

import 'package:chat_app_test/Espace_Admin/Acceuil_Admin/Search/Profiles.dart';
import 'package:chat_app_test/Espace_Admin/Profile_Admin/ProfilAdmin.dart';
import 'package:flutter/material.dart';

class SearchApprenant extends StatefulWidget {
  const SearchApprenant({Key? key}) : super(key: key);

  @override
  State<SearchApprenant> createState() => _SearchState();
}

class _SearchState extends State<SearchApprenant> {
  final controller = TextEditingController();
  List<profiles> profile = allProfiles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 241, 241),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 241, 241),
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
                  color: Color.fromARGB(255, 36, 36, 37),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 213, 213, 218),
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
                            style: TextStyle(
                                color: Color.fromARGB(255, 29, 28, 28),
                                fontWeight: FontWeight.bold),
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
