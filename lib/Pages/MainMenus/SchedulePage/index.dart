import 'package:flutter/material.dart';
import 'package:kumande/Components/Forms/input.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/MainMenus/SchedulePage/Usecases/get_daily_calorie.dart';
import 'package:kumande/Pages/MainMenus/SchedulePage/Usecases/get_daily_spend.dart';
import 'package:kumande/Pages/MainMenus/SchedulePage/Usecases/get_my_schedule.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    //double fullWidth = MediaQuery.of(context).size.width;

    toogleCalendarView(String slct) {
      if (slct == "Total Spending") {
        return const GetDailySpend();
      } else if (slct == "Total Calorie") {
        return const GetDailyCalorie();
      }
    }

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: fullHeight * 0.06),
        children: [
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: paddingContainerLG, top: paddingContainerLG),
                  child: getInputLabel("Calendar", primaryBg, textLg)),
              const Spacer(),
              Container(
                margin: EdgeInsets.only(right: paddingContainerLG),
                child: getDropDownMain(slctCalendarView, optionsCalendarView,
                    (String newValue) {
                  setState(() {
                    slctCalendarView = newValue;
                  });
                }),
              )
            ],
          ),
          toogleCalendarView(slctCalendarView),
          Padding(
              padding: EdgeInsets.only(
                  left: paddingContainerLG, top: paddingContainerLG),
              child: getInputLabel("My Schedule", primaryBg, textLg)),
          const GetMySchedule()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successBg,
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
