import 'package:flutter/material.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Modules/APIs/Models/Payment/Queries/queries.dart';
import 'package:kumande/Modules/APIs/Services/Payment/Queries/queries.dart';
import 'package:kumande/Modules/Helpers/converter.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
//import 'package:table_calendar/table_calendar.dart';

class GetDailyConsume extends StatefulWidget {
  const GetDailyConsume({Key key}) : super(key: key);

  @override
  State<GetDailyConsume> createState() => _GetDailyConsumeState();
}

class _GetDailyConsumeState extends State<GetDailyConsume> {
  CalendarFormat format = CalendarFormat.month;
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
            //print(contents[0].ctx);
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesPaymentLineChartModel> contents) {
    return TableCalendar(
      focusedDay: selectedDay,
      firstDay: DateTime.utc(2022),
      lastDay: DateTime.utc(2052),
      weekendDays: const [DateTime.sunday],
      calendarFormat: format,
      onPageChanged: (focusedDay) {
        setState(() {
          monthCalendar = focusedDay.month;
          selectedDay = focusedDay;
        });
      },
      onFormatChanged: (CalendarFormat val) {
        setState(
          () {
            format = val;
          },
        );
      },
      startingDayOfWeek: StartingDayOfWeek.sunday,
      daysOfWeekVisible: true,
      calendarBuilders: CalendarBuilders(
        markerBuilder: (BuildContext context, DateTime date, events) {
          for (var content in contents) {
            print(content);
            if (content.ctx == date.day.toString() &&
                date.month == monthCalendar &&
                date.year == yearCalendar) {
              if (content.total > 0) {
                return Text(
                  convertPriceK(content.total),
                  style: TextStyle(
                    color: successBg,
                    fontWeight: FontWeight.w500,
                    fontSize: textSm,
                  ),
                );
              } else {
                return SizedBox();
              }
            }
          }
        },
      ),

      // Day Changed
      onDaySelected: (DateTime selectDay, DateTime focusDay) {
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
        //print(selectedDay);
      },
      selectedDayPredicate: (DateTime date) {
        return isSameDay(selectedDay, date);
      },

      //To style the Calendar
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        selectedDecoration: BoxDecoration(
          color: primaryBg,
          shape: BoxShape.circle,
        ),
        todayDecoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        todayTextStyle: TextStyle(color: primaryBg),
        selectedTextStyle: const TextStyle(color: Colors.white),
        holidayTextStyle: const TextStyle(color: Colors.red),
        weekendTextStyle: const TextStyle(color: Colors.red),
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.red),
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
    );
  }
}
