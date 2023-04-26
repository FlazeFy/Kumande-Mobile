import 'package:flutter/material.dart';
import 'package:kumande/Components/Forms/calendar.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Modules/APIs/Models/Payment/Queries/queries.dart';
import 'package:kumande/Modules/APIs/Services/Payment/Queries/queries.dart';
import 'package:kumande/Modules/Helpers/converter.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:table_calendar/table_calendar.dart';

class GetDailySpend extends StatefulWidget {
  const GetDailySpend({Key key}) : super(key: key);

  @override
  State<GetDailySpend> createState() => _GetDailySpendState();
}

class _GetDailySpendState extends State<GetDailySpend> {
  DateTime selectedDay = slctSchedule;
  DateTime focusedDay = slctSchedule;
  QueriesPaymentService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesPaymentService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getTotalSpendDay(monthCalendar, yearCalendar),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesPaymentLineChartModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesPaymentLineChartModel> contents = snapshot.data;
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesPaymentLineChartModel> contents) {
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
        "spend");
  }
}
