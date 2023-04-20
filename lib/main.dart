import 'package:flutter/material.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Pages/Landings/LoginPage/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kumande Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
