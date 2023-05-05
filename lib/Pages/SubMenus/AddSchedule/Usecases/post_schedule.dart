import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kumande/Components/Forms/input.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/APIs/Services/Consume/Commands/commands_list.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';

class PostSchedule extends StatefulWidget {
  PostSchedule(
      {Key key,
      this.scheduleDesc,
      this.scheduleConsume,
      this.setConsumeCal,
      this.consumeProvider,
      this.consumeMainIng,
      this.scheduleTime})
      : super(key: key);
  TextEditingController scheduleDesc;
  TextEditingController scheduleConsume;
  TextEditingController consumeProvider;
  TextEditingController consumeMainIng;
  DateTime scheduleTime;

  final Function(double) setConsumeCal;

  @override
  State<PostSchedule> createState() => _PostScheduleState();
}

class _PostScheduleState extends State<PostSchedule> {
  var scheduleConsume = TextEditingController();
  var scheduleDesc = TextEditingController();
  ConsumeListCommandsService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ConsumeListCommandsService();
  }

  void _refreshPage() {
    setState(() {});
  }

  @override
  void dispose() {
    scheduleDesc.dispose();
    scheduleConsume.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;
    bool _isLoading = false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getInputLabel("Consume", primaryBg, textLg),
        getInputLabel("Name", textPrimary, textSm),
        getInputTextMain(widget.scheduleDesc, "ex : healthy food", 50, false),
        getInputLabel("Provide", textPrimary, textSm),
        getInputTextMain(widget.consumeProvider, "ex : Warung Budi", 50, false),
        getInputLabel("Main Ingredient", textPrimary, textSm),
        getInputTextMain(widget.consumeMainIng, "ex : Meat", 50, false),
        Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getInputLabel("Type", textPrimary, textSm),
                    getDropDownMain(slctConsumeType, optionsConsumeType,
                        (String newValue) {
                      setState(() {
                        slctConsumeType = newValue;
                      });
                    })
                  ]),
            ),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  getInputLabel("Calorie", textPrimary, textSm),
                  getInputNumberMain(
                      widget.setConsumeCal, "Cal", 10.0, 600.0, 120.0)
                ])),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 10),
        Divider(
          height: paddingDivider,
          thickness: 1,
        ),
        getInputLabel("Schedule", primaryBg, textLg),
        const SizedBox(height: 10),
        getInputDescMain(widget.scheduleConsume,
            "ex : vegetables, fruits, juice, etc", 255, 5, 5),
        Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getInputLabel("Day", textPrimary, textSm),
                    getDropDownMain(slctScheduleDay, optionsScheduleDay,
                        (String newValue) {
                      setState(() {
                        slctScheduleDay = newValue;
                      });
                    })
                  ]),
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getInputLabel("Category", textPrimary, textSm),
                    getDropDownMain(slctScheduleCat, optionsScheduleCat,
                        (String newValue) {
                      setState(() {
                        slctScheduleCat = newValue;
                      });
                    })
                  ]),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getInputLabel("Time (24 hr)", textPrimary, 13.0),
                  getDatePicker(widget.scheduleTime, () {
                    final now = DateTime.now();

                    DatePicker.showTimePicker(context,
                        showTitleActions: true,
                        showSecondsColumn: false, onConfirm: (date) {
                      setState(() {
                        widget.scheduleTime = date;
                      });
                    },
                        currentTime: DateTime(now.year, now.month, now.day),
                        locale: LocaleType.en);
                  }, "", "time")
                ])
          ],
        ),
        const SizedBox(height: 10),
        Divider(
          height: paddingDivider,
          thickness: 1,
        ),
        getInputLabel("My Tag", primaryBg, textLg),
        generateTag(tagListDummy, _refreshPage, "tag_consume_list"),
        const SizedBox(height: 10),
        generateSelectedTag(
            selectedTagConsumeList, _refreshPage, "tag_consume_list"),
        const SizedBox(height: 50),
      ],
    );
  }
}
