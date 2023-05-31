import 'package:flutter/material.dart';
import 'package:kumande/Components/Forms/input.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/APIs/Schedule/Models/Queries/queries.dart';
import 'package:kumande/Modules/APIs/Schedule/Services/Queries/queries.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/MainMenus/SchedulePage/Usecases/get_daily_calorie.dart';
import 'package:kumande/Pages/MainMenus/SchedulePage/Usecases/get_daily_spend.dart';
import 'package:kumande/Pages/MainMenus/SchedulePage/Usecases/get_my_schedule.dart';
import 'package:kumande/Pages/SubMenus/AddSchedule/index.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  QueriesScheduleService apiService;
  int i = 0;

  @override
  void initState() {
    super.initState();

    apiService = QueriesScheduleService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getMySchedule(),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesMyScheduleModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesMyScheduleModel> contents = snapshot.data;
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesMyScheduleModel> contents) {
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
        padding: EdgeInsets.only(top: fullHeight * 0.04),
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
          GetMySchedule(schedule: contents)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successBg,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddSchedulePage()),
          );
        },
        tooltip: 'Add Schedule',
        child: const Icon(Icons.add),
      ),
    );
  }
}
