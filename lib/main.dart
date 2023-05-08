import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Pages/Landings/LoginPage/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool shouldUseFirestoreEmulator = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (shouldUseFirestoreEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }

  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey("token_key")) {
    runApp(MyApp(signed: true));
  } else {
    runApp(MyApp(signed: false));
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key key, this.signed}) : super(key: key);
  bool signed;

  @override
  Widget build(BuildContext context) {
    //Lock device on portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (signed) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kumande Mobile',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BottomBar(),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kumande Mobile',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      );
    }
  }
}
