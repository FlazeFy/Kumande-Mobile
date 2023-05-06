import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kumande/Components/Dialogs/failed.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Components/Navbars/top.dart';
import 'package:kumande/Modules/APIs/Models/Schedule/Commands/commands.dart';
import 'package:kumande/Modules/APIs/Services/Schedule/Commands/commands.dart';
import 'package:kumande/Modules/Helpers/validator.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/SubMenus/AddSchedule/Usecases/post_schedule.dart';

class AddSchedulePage extends StatefulWidget {
  const AddSchedulePage({Key key}) : super(key: key);

  @override
  State<AddSchedulePage> createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  var scheduleConsume = TextEditingController();
  var scheduleDesc = TextEditingController();
  var consumeMainIng = TextEditingController();
  var consumeProvider = TextEditingController();
  int consumeCalCtrl = 120;
  DateTime scheduleTime;
  ScheduleCommandsService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ScheduleCommandsService();
  }

  @override
  void dispose() {
    scheduleDesc.dispose();
    scheduleConsume.dispose();
    consumeMainIng.dispose();
    consumeProvider.dispose();
    super.dispose();
  }

  void setConsumeCal(double val) {
    setState(() {
      consumeCalCtrl = val.toInt();
    });
  }

  void setScheduleTime(DateTime newTime) {
    setState(() {
      scheduleTime = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;
    bool _isLoading = false;

    return Scaffold(
      appBar: getAppbar("Add Schedule"),
      body: ListView(
        padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
        children: [
          PostSchedule(
            scheduleConsume: scheduleConsume,
            scheduleDesc: scheduleDesc,
            setConsumeCal: setConsumeCal,
            consumeProvider: consumeProvider,
            consumeMainIng: consumeMainIng,
            scheduleTime: scheduleTime,
            setScheduleTime: setScheduleTime,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successBg,
        onPressed: () async {
          if (consumeProvider.text.isNotEmpty &&
              consumeMainIng.text.isNotEmpty) {
            var detail = [
              {
                "provide": consumeProvider.text,
                "calorie": consumeCalCtrl.toInt(),
                "main_ing": consumeMainIng.text
              }
            ];

            var time = [
              {
                "day": slctScheduleDay.substring(0, 3),
                "category": slctScheduleCat,
                "time": validateTime(scheduleTime),
              }
            ];

            AddScheduleModel data = AddScheduleModel(
                scheduleConsume: scheduleConsume.text,
                consumeType: slctConsumeType,
                scheduleDesc: scheduleDesc.text,
                consumeDetail: jsonEncode(detail),
                scheduleTag: jsonEncode(selectedTagConsume),
                scheduleTime: jsonEncode(time));

            //Validator
            if (data.scheduleConsume.isNotEmpty &&
                data.consumeType.isNotEmpty) {
              apiService.addSchedule(data).then((response) {
                setState(() => _isLoading = false);
                var status = response[0]['status'];
                var body = response[0]['body'];

                if (status == "success") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BottomBar()),
                  );
                  setState(() {
                    page = 2;
                  });
                } else {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          FailedDialog(text: body));

                  scheduleDesc.clear();
                  scheduleConsume.clear();
                  consumeMainIng.clear();
                  consumeProvider.clear();
                }
              });
            } else {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => FailedDialog(
                      text: "Add schedule, some field can't be empty"));
            }
          } else {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => FailedDialog(
                    text: "Add schedule, some field can't be empty"));
          }
        },
        tooltip: 'Save',
        child: const Icon(Icons.check),
      ),
    );
  }
}
