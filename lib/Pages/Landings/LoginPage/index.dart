import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/Landings/LoginPage/Usecases/post_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
          height: fullHeight,
          width: fullWidth,
          color: primaryBg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   padding: EdgeInsets.only(top: fullHeight * 0.05),
              //   margin: EdgeInsets.symmetric(
              //       vertical: 20, horizontal: fullWidth * 0.2),
              //   child: Image.asset('assets/img/logo.png', width: fullWidth),
              // ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: fullWidth * 0.05),
                  child: Column(children: [
                    Text("Kumande",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: textJumbo,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(
                        "Make food scheduling, analyze it, tracking, and choose your meals for tommorrow",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Colors.white, fontSize: textSm)),
                  ])),
              const PostLogin()
            ],
          )),
    );
  }
}
