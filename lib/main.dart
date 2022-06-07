import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/HomePageHelpers.dart';
import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/Home_Helpers.dart';
import 'package:chat_app_test/Espace_Apprenant/Acceuil_Apprenant/UploadPost.dart';
import 'package:chat_app_test/Espace_Apprenant/Profile_Apprenant/ProfileHelpers.dart';
import 'package:chat_app_test/SplashScreen/splash_screen.dart';
import 'package:chat_app_test/services/fireBaseOperations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        // ignore: prefer_const_constructors
        child: MaterialApp(
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        ),
        providers: [
          ChangeNotifierProvider(create: (_) => HomeHelpers()),
          ChangeNotifierProvider(create: (_) => UploadPost()),
          ChangeNotifierProvider(create: (_) => FireBaseOperations()),
          ChangeNotifierProvider(create: (_) => ProfileHelpers()),
          ChangeNotifierProvider(create: (_) => HomePageHelpers()),
        ]);
  }
}    
      /* home: FutureBuilder(
          future: AuthMethods().getCurrentUser(),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return const Home();
            } else {
              return const SignIn();
            }
          },
        )*/