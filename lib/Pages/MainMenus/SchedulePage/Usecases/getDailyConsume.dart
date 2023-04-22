import 'package:flutter/material.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:table_calendar/table_calendar.dart';
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

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: selectedDay,
      firstDay: DateTime.utc(2022),
      lastDay: DateTime.utc(2052),
      weekendDays: const [DateTime.sunday],
      calendarFormat: format,
      onFormatChanged: (CalendarFormat val) {
        setState(
          () {
            format = val;
          },
        );
      },
      startingDayOfWeek: StartingDayOfWeek.sunday,
      daysOfWeekVisible: true,

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
