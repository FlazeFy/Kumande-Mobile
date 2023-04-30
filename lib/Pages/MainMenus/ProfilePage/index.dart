import 'package:flutter/material.dart';
import 'package:kumande/Components/Backgrounds/custom.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/MainMenus/ProfilePage/Usecases/edit_profile.dart';
import 'package:kumande/Pages/MainMenus/ProfilePage/Usecases/get_profile_header.dart';
import 'package:kumande/Pages/MainMenus/ProfilePage/Usecases/show_payment_data.dart';
import 'package:kumande/Pages/MainMenus/ProfilePage/Usecases/show_body_data.dart';
import 'package:kumande/Pages/MainMenus/ProfilePage/Usecases/show_consume_data.dart';

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
                padding: EdgeInsets.only(top: fullHeight * 0.035),
                children: [
                  ShowProfileHeader(),
                  const ShowPaymentData(),
                  const ShowHealthData(),
                  const ShowConsumeData(),
                  Container(
                      height: fullHeight * 0.7,
                      margin: EdgeInsets.only(top: paddingContainerLG * 2),
                      padding: EdgeInsets.all(paddingContentSM),
                      decoration: BoxDecoration(
                        color: whiteBg,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [const EditProfile()],
                      )),
                ])));
  }
}
