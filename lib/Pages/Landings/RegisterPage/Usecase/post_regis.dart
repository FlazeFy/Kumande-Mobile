import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kumande/Components/Dialogs/failed.dart';
import 'package:kumande/Components/Forms/input.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/APIs/Models/User/Commands/commands.dart';
import 'package:kumande/Modules/APIs/Services/User/Commands/commands.dart';
import 'package:kumande/Modules/Firebases/Auths/auth.dart';
import 'package:kumande/Modules/Helpers/validator.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/Landings/LoginPage/index.dart';

class PostRegis extends StatefulWidget {
  const PostRegis({Key key}) : super(key: key);

  @override
  State<PostRegis> createState() => _PostRegisState();
}

class _PostRegisState extends State<PostRegis> {
  final usernameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final fnameCtrl = TextEditingController();
  final unameCtrl = TextEditingController();
  DateTime dateBorn;

  UserCommandsService apiService;

  @override
  void initState() {
    super.initState();
    apiService = UserCommandsService();
  }

  @override
  Widget build(BuildContext context) {
    //double fullHeight = MediaQuery.of(context).size.height;
    //double fullWidth = MediaQuery.of(context).size.width;
    bool isLoading = false;

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
            getInputTextMain(passCtrl, "Password", 50, true),
            const SizedBox(
              height: 5,
            ),
            getInputTextMain(fnameCtrl, "Fullname", 50, false),
            const SizedBox(
              height: 5,
            ),
            getInputTextMain(unameCtrl, "Username", 35, false),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    getInputLabel("Profile", primaryBg, 13.0),
                    getDropDownMain(slctGender, optionsGender,
                        (String newValue) {
                      setState(() {
                        slctGender = newValue;
                      });
                    }),
                  ],
                ),
                const Spacer(),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      getInputLabel("Date (Optional)", primaryBg, 13.0),
                      getDatePicker(dateBorn, () {
                        final now = DateTime.now();

                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(
                                now.year - 100, now.month, now.day), //Tomorrow
                            maxTime: DateTime(now.year - 1, now.month, now.day),
                            onConfirm: (date) {
                          setState(() {
                            dateBorn = date;
                          });
                        },
                            currentTime:
                                DateTime(now.year - 17, now.month, now.day),
                            locale: LocaleType.en);
                      }, "Born", "date")
                    ])
              ],
            )
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
                    AddUserModel data = AddUserModel(
                        firebaseId: user.uid,
                        fullname: fnameCtrl.text,
                        username: unameCtrl.text,
                        email: emailCtrl.text,
                        password: passCtrl.text,
                        gender: slctGender,
                        dateBorn: validateDate(dateBorn));

                    //Validator
                    if (data.email.isNotEmpty && data.password.isNotEmpty) {
                      apiService.addUser(data).then((response) {
                        setState(() => isLoading = false);
                        var status = response[0]['message'];
                        var body = response[0]['body'];

                        if (status == "success") {
                          // try {
                          //   SignInModule().signInEmailPass(
                          //       email: data.email, password: data.password);
                          // } on FirebaseAuthException catch (e) {
                          //   showDialog<String>(
                          //       context: context,
                          //       builder: (BuildContext context) =>
                          //           FailedDialog(text: e));
                          // }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  FailedDialog(text: body));
                        }
                      });
                    } else {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => FailedDialog(
                              text: "Register failed, field can't be empty"));
                    }
                  } else {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => FailedDialog(
                            text: "Create acc failed, please check your data"));
                  }
                } catch (e) {
                  String errorMessage = e.toString();
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>
                        FailedDialog(text: errorMessage),
                  );
                }

                emailCtrl.clear();
                passCtrl.clear();
                fnameCtrl.clear();
                unameCtrl.clear();
              },
              child: const Text("Submit", style: TextStyle(fontSize: 15))))
    ]);
  }
}
