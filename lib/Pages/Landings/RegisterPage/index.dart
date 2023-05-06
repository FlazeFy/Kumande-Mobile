import 'package:flutter/material.dart';
import 'package:kumande/Components/Backgrounds/custom.dart';
import 'package:kumande/Pages/Landings/RegisterPage/Usecase/post_regis.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: CustomPaint(
            painter: CirclePainter(),
            child: ListView(
                padding: EdgeInsets.only(
                    top: fullHeight * 0.1,
                    right: fullWidth * 0.065,
                    left: fullWidth * 0.065),
                children: const [PostRegis()])));
  }
}
