import 'package:flutter/material.dart';
import 'package:kumande/Modules/Helpers/converter.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:table_calendar/table_calendar.dart';

Widget getTableCalendar(
    DateTime selectedDay,
    Function(DateTime) actionPageChaged,
    var contents,
    Function(DateTime, DateTime) actionDaySelected,
    String desc) {
  getLabelType(String type, int total) {
    if (type == "spend") {
      return convertPriceK(total);
    } else if (type == "cal") {
      return "$total cal";
    }
  }

  return TableCalendar(
    focusedDay: selectedDay,
    firstDay: DateTime.utc(2022),
    lastDay: DateTime.utc(2052),
    weekendDays: const [DateTime.sunday],
    calendarFormat: CalendarFormat.month,
    onPageChanged: actionPageChaged,
    onFormatChanged: (format) {}, // Only Month format
    startingDayOfWeek: StartingDayOfWeek.sunday,
    daysOfWeekVisible: true,
    calendarBuilders: CalendarBuilders(
      markerBuilder: (BuildContext context, DateTime date, events) {
        for (var content in contents) {
          if (content.ctx == date.day.toString() &&
              date.month == monthCalendar &&
              date.year == yearCalendar) {
            if (content.total > 0) {
              return Text(
                getLabelType(desc, content.total),
                style: TextStyle(
                  color: successBg,
                  fontWeight: FontWeight.w500,
                  fontSize: textSm - 1,
                ),
              );
            } else {
              return const SizedBox();
            }
          }
        }
      },
    ),

    // Day Changed
    onDaySelected: actionDaySelected,
    selectedDayPredicate: (DateTime date) {
      return isSameDay(selectedDay, date);
    },

    //To style the Calendar
    calendarStyle: CalendarStyle(
      cellMargin: EdgeInsets.zero,
      cellPadding: EdgeInsets.zero,
      tablePadding: const EdgeInsets.only(top: 0),
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
