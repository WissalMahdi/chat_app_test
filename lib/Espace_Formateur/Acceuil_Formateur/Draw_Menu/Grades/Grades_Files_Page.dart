// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_final_fields

import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/Draw_Menu/Grades/Grades.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class FilesPage extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;

  const FilesPage({
    Key? key,
    required this.files,
    required this.onOpenedFile,
  }) : super(key: key);

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  Random _random = Random();

  List<List<Color>> gradientColors = [];
  List<Color> gradientFirst = [
    Color.fromARGB(255, 63, 11, 63),
    Color.fromARGB(255, 102, 67, 134),
    Color.fromARGB(255, 85, 25, 90)
  ];
  List<Color> gradientSecond = [
    Color.fromARGB(255, 141, 40, 119),
    Color.fromARGB(255, 194, 151, 181),
    Color.fromARGB(255, 160, 43, 135)
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
    Color.fromARGB(255, 105, 64, 10),
    Color.fromARGB(255, 216, 167, 178),
    Color.fromARGB(255, 175, 101, 79)
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
      backgroundColor: const Color.fromARGB(255, 206, 204, 204),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 77, 80),
        title: const Text("Add Grades",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 25,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Grades()));
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
        backgroundColor: Color.fromARGB(255, 65, 63, 63),
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
          builder: (context) => FilesPage(
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
