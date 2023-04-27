// Chart
import 'package:flutter/material.dart';
import 'package:kumande/Components/Containers/dashboard.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/MainMenus/HistoryPage/Usecases/get_all_consume_pagination.dart';

class PieData {
  PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String text;
}

class LineData {
  LineData(this.month, this.total);

  final String month;
  final double total;
}

// Consume
String slctConsumeFrom = "GoFood";
List<String> optionsConsumeFrom = [
  "GoFood",
  "GrabFood",
  "ShopeeFood",
  "Dine-In",
  "Take Away",
];

String slctConsumeType = "Food";
List<String> optionsConsumeType = [
  "Food",
  "Drink",
  "Snack",
];

String slctConsumeFilterOrder = "Desc";
List<String> optionsConsumeFilterOrder = [
  "Asc",
  "Desc",
];

String slctConsumePaymentMethod = "GoPay";
List<String> optionsConsumePaymentMethod = [
  "GoPay",
  "Ovo",
  "Dana",
  "Link Aja",
  "MBanking",
  "Cash",
  "Gift",
  "Cuppon",
];

List<String> selectedTagConsume = [];
List<String> selectedTagConsumeList = [];

List<String> tagListDummy = [
  "Cheap",
  "Tasty",
  "Spicy",
  "Fast Food",
  "Healthy",
];

var tabcolHistoryConsume = [
  {"title": "All", "class": GetAllConsumeWPagination(type: "All")},
  {"title": "Food", "class": GetAllConsumeWPagination(type: "Food")},
  {"title": "Drink", "class": GetAllConsumeWPagination(type: "Drink")},
  {"title": "Snack", "class": GetAllConsumeWPagination(type: "Snack")}
];

// Calendar
DateTime slctSchedule = DateTime.now();
int selectedIndex = 0;

String slctCalendarView = "Total Spending";
List<String> optionsCalendarView = ["Total Spending", "Total Calorie"];

// Schedule
var tableCellSchedule = [
  {
    "title": TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        child: Text("Day",
            style: TextStyle(color: whiteBg, fontWeight: FontWeight.w500)),
      ),
    ),
    "breakfast": TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        alignment: Alignment.center,
        child: getScheduleIcon(35, "Breakfast"),
      ),
    ),
    "lunch": TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(paddingContentSM),
        child: getScheduleIcon(35, "Lunch"),
      ),
    ),
    "dinner": TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(paddingContentSM),
        child: getScheduleIcon(35, "Dinner"),
      ),
    ),
  }
];

// Navigation
int page = 0;
int monthCalendar = getDateNowInt("month");
int yearCalendar = getDateNowInt("year");
