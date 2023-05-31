import 'package:flutter/material.dart';
import 'package:kumande/Components/Forms/calendar.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Modules/APIs/Consume/Models/Queries/queries.dart';
import 'package:kumande/Modules/APIs/Consume/Services/Queries/queries.dart';
import 'package:kumande/Modules/Variables/global.dart';
//import 'package:table_calendar/table_calendar.dart';

class GetDailyCalorie extends StatefulWidget {
  const GetDailyCalorie({Key key}) : super(key: key);

  @override
  State<GetDailyCalorie> createState() => _GetDailyCalorieState();
}

class _GetDailyCalorieState extends State<GetDailyCalorie> {
  DateTime selectedDay = slctSchedule;
  DateTime focusedDay = slctSchedule;
  QueriesConsumeService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesConsumeService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getTotalDailyCal(monthCalendar, yearCalendar),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesConsumeLineChartModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesConsumeLineChartModel> contents = snapshot.data;
            //print(contents[0].ctx);
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesConsumeLineChartModel> contents) {
    return getTableCalendar(
        selectedDay,
        (DateTime focusedDay) {
          setState(() {
            monthCalendar = focusedDay.month;
            selectedDay = focusedDay;
          });
        },
        contents,
        (DateTime selectDay, DateTime focusDay) {
          setState(
            () {
              selectedDay = selectDay;
              focusedDay = focusDay;
              slctSchedule = selectDay;
              selectedIndex = 2;

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BottomBar()),
              );
              setState(() {
                page = 2;
              });
            },
          );
        },
        "cal");
  }
}
