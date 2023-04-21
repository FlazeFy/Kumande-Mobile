import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kumande/Components/Dialogs/failed.dart';
import 'package:kumande/Components/Forms/input.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/APIs/Models/Auth/Commands/commands.dart';
import 'package:kumande/Modules/APIs/Services/Auth/Commands/commands.dart';
import 'package:kumande/Modules/Firebases/Auths/auth.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostLogin extends StatefulWidget {
  @override
  State<PostLogin> createState() => _PostLoginState();
}

class _PostLoginState extends State<PostLogin> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  LoginCommandsService apiService;

  @override
  void initState() {
    super.initState();
    apiService = LoginCommandsService();
  }

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;
    bool _isLoading = false;

    return Container(
      width: fullWidth,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white.withOpacity(0.4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getInputLabel("Email", textPrimary, textMd),
          getInputTextMain(emailCtrl, "email", 35),
          getInputLabel("Password", textPrimary, textMd),
          getInputTextMain(passCtrl, "Password", 35),
          Container(
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                    backgroundColor: MaterialStatePropertyAll<Color>(successBg),
                  ),
                  onPressed: () async {
                    LoginModel data = LoginModel(
                      email: emailCtrl.text,
                      password: passCtrl.text,
                    );

                    //Validator
                    if (data.email.isNotEmpty && data.password.isNotEmpty) {
                      apiService.addLogin(data).then((response) {
                        setState(() => _isLoading = false);
                        var status = response[0]['message'];
                        var body = response[0]['body'];

                        if (status == "success") {
                          try {
                            AuthModule().signInEmailPass(
                                email: data.email, password: data.password);
                          } on FirebaseAuthException catch (e) {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    FailedDialog(text: e));
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BottomBar()),
                          );
                        } else {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  FailedDialog(text: body));

                          emailCtrl.clear();
                          passCtrl.clear();
                        }
                      });
                    } else {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => FailedDialog(
                              text: "Login failed, field can't be empty"));
                    }
                    final prefs = await SharedPreferences.getInstance();
                    final token = prefs.getString('token_key');
                  },
                  child: const Text("Sign In", style: TextStyle(fontSize: 15))))
        ],
      ),
    );
  }
}
