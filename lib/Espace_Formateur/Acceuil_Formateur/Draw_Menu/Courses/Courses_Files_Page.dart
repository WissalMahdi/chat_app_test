// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_final_fields

import 'dart:io';
import 'dart:math';

import 'package:chat_app_test/Espace_Formateur/Acceuil_Formateur/Draw_Menu/Courses/Courses.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class CoursesFilesPage extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;

  const CoursesFilesPage({
    Key? key,
    required this.files,
    required this.onOpenedFile,
  }) : super(key: key);

  @override
  State<CoursesFilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<CoursesFilesPage> {
  Random _random = Random();

  List<List<Color>> gradientColors = [];
  List<Color> gradientFirst = [
    Color.fromARGB(255, 8, 11, 230),
    Color.fromARGB(255, 74, 50, 209),
    Color.fromARGB(255, 155, 172, 202)
  ];
  List<Color> gradientSecond = [
    Color.fromARGB(255, 40, 101, 141),
    Color.fromARGB(255, 19, 50, 117),
    Color.fromARGB(255, 7, 32, 177)
  ];
  List<Color> gradientThird = [
    Color(0xFFffffff),
    Color(0xFF076585),
    Color(0xFF076585)
  ];
  List<Color> gradientFourth = [
    Color.fromARGB(255, 14, 59, 194),
    Color.fromARGB(255, 183, 189, 209),
    Color.fromARGB(255, 12, 171, 230)
  ];
  List<Color> gradientFifth = [
    Color.fromARGB(255, 12, 10, 105),
    Color.fromARGB(255, 247, 245, 245),
    Color.fromARGB(255, 33, 3, 209)
  ];

  @override
  void initState() {
    super.initState();
    gradientColors.addAll({
      gradientFirst,
      gradientSecond,
      gradientThird,
      gradientFourth,
      gradientFifth
    });
  }

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
        title: const Text("Add Courses",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 25,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => CoursesF()));
            }),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
            itemCount: widget.files.length,
            itemBuilder: (context, index) {
              final file = widget.files[index];
              return buildFile(file);
            }),
      ),

      //-- Elli kenou fel Classe mtaa Premiere_MID --//
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await FilePicker.platform
              .pickFiles(allowMultiple: true, type: FileType.any);
          if (result == null) return;
          openFiles(result.files);
          final file = result.files.first;
          //openFile(file);

          final newFile = await saveFilePermanently(file);
        },
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 20, 53, 197),
      ),
    );
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationSupportDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  void openFiles(List<PlatformFile> files) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CoursesFilesPage(
                files: files,
                onOpenedFile: openFile,
              )));

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
  //-- Hatta l houni --//

  Widget buildFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final extension = file.extension ?? 'none';
    //final color = getColor(extension);

    return InkWell(
      onTap: () => OpenFile.open(file.path!),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:
                      gradientColors[_random.nextInt(gradientColors.length)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '.$extension',
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            )),
            const SizedBox(
              height: 8,
            ),
            Text(
              file.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
