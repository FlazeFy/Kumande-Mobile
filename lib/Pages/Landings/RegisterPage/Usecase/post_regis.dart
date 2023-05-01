import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kumande/Components/Dialogs/failed.dart';
import 'package:kumande/Components/Forms/input.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/Firebases/Auths/auth.dart';
import 'package:kumande/Modules/Variables/style.dart';

class PostRegis extends StatefulWidget {
  const PostRegis({Key key}) : super(key: key);

  @override
  State<PostRegis> createState() => _PostRegisState();
}

class _PostRegisState extends State<PostRegis> {
  final usernameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Column(children: [
      Container(
          padding: EdgeInsets.symmetric(
              horizontal: paddingContainerLG, vertical: paddingContainerLG * 2),
          decoration: BoxDecoration(
              color: whiteBg,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(children: [
            getInputLabel("Profile", primaryBg, 18.0),
            const SizedBox(
              height: 10,
            ),
            getInputTextMain(emailCtrl, "Email", 75, false),
            const SizedBox(
              height: 5,
            ),
            getInputTextMain(passCtrl, "Password", 75, true)
          ])),
      Container(
          margin: const EdgeInsets.only(top: 10),
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                )),
                backgroundColor: MaterialStatePropertyAll<Color>(successBg),
              ),
              onPressed: () async {
                try {
                  User user = await RegisterModule.registerUsingEmailPassword(
                    email: emailCtrl.text,
                    password: passCtrl.text,
                  );
                  if (user != null) {
                    print(user.uid);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomBar()),
                    );
                  } else {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => FailedDialog(
                            text: "Create acc failed, please check your data"));

                    emailCtrl.clear();
                    passCtrl.clear();
                  }
                } catch (e) {
                  String errorMessage = e.toString();
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>
                        FailedDialog(text: errorMessage),
                  );
                  emailCtrl.clear();
                  passCtrl.clear();
                }
              },
              child: const Text("Submit", style: TextStyle(fontSize: 15))))
    ]);
  }
}
