import 'package:DontDieBro/DataProvides/appData.dart';
import 'package:DontDieBro/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/mainpage.dart';
import 'screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'db2',
    options: Platform.isIOS || Platform.isMacOS
        ? FirebaseOptions(
            appId: '1:297855924061:ios:c6de2b69b03a5be8',
            apiKey: 'AIzaSyD_shO5mfO9lhy2TVWhfo1VUmARKlG4suk',
            projectId: 'flutter-firebase-plugins',
            messagingSenderId: '297855924061',
            databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
          )
        : FirebaseOptions(
            appId: "1:915192973455:android:09ea1a6ae0c99b24eb08fa",
            apiKey: "AIzaSyDWUkuj5K3oH1n4jGG_XGjxLGF3ibdZZ1E",
            messagingSenderId: '297855924061',
            projectId: 'dontdiebro-flutter',
            databaseURL: 'https://dontdiebro-flutter.firebaseio.com',
          ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RegistrationScreen.id,
        routes: {
          RegistrationScreen.id: (context) => RegistrationScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          MainPage.id: (context) => MainPage()
        },
      ),
    );
  }
}
