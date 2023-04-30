import 'package:flutter/material.dart';
import 'package:kumande/Components/Forms/input.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/APIs/Models/User/Queries/queries.dart';
import 'package:kumande/Modules/APIs/Services/User/Queries/queries.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  QueriesUserService apiService;
  final fullnameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  DateTime dateBornCtrl;
  String genderCtrl;

  @override
  void initState() {
    super.initState();
    apiService = QueriesUserService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getMyProfile(),
        builder: (BuildContext context,
            AsyncSnapshot<List<UserProfileModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<UserProfileModel> contents = snapshot.data;
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<UserProfileModel> contents) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;
    genderCtrl = contents[0].gender;
    fullnameCtrl.text = contents[0].fullname;
    passwordCtrl.text = contents[0].password;
    passwordCtrl.text = contents[0].password;
    dateBornCtrl ??= DateTime.parse(contents[0].bornAt);

    return Container(
      margin: EdgeInsets.only(
          left: paddingContainerLG * 2, right: paddingContainerLG * 2),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getInputLabel("Fullname", primaryBg, textMd),
            getInputTextMain(fullnameCtrl, "ex : Jhon Doe", 75, false),
            getInputLabel("Password", primaryBg, textMd),
            getInputTextMain(passwordCtrl, "ex : pass123", 75, true),
            getInputLabel("Email", primaryBg, textMd),
            getInputLabel(contents[0].email, textSecondary, textSm + 2),
            SizedBox(height: paddingContentSM * 2),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getInputLabel("Date Born", primaryBg, textMd),
                    getDatePicker(dateBornCtrl, () {
                      final now = DateTime.now();

                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime:
                              DateTime(now.year, now.month, now.day), //Tomorrow
                          maxTime: DateTime(now.year + 1, now.month, now.day),
                          onConfirm: (date) {
                        setState(() {
                          dateBornCtrl = date;
                        });
                      }, currentTime: dateBornCtrl, locale: LocaleType.en);
                    }, "Born", "date"),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getInputLabel("Gender", primaryBg, textMd),
                    getDropDownMain(genderCtrl, optionsGender,
                        (String newValue) {
                      setState(() {
                        genderCtrl = newValue;
                      });
                    })
                  ],
                )
              ],
            )
          ]),
    );
  }
}
