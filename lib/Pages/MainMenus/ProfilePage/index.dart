import 'package:flutter/material.dart';
import 'package:kumande/Components/Backgrounds/custom.dart';
import 'package:kumande/Pages/MainMenus/ProfilePage/Usecases/get_profile_header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: CustomPaint(
            painter: CirclePainter(),
            child: ListView(
                padding: EdgeInsets.only(top: fullHeight * 0.04),
                children: [ShowProfileHeader()])));
  }
}
