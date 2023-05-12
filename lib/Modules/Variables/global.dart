// Chart
import 'package:flutter/material.dart';
import 'package:kumande/Components/Containers/dashboard.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/MainMenus/HistoryPage/Usecases/get_all_consume_pagination.dart';
import 'package:kumande/Pages/SubMenus/StatisticPage/index.dart';

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

String slctScheduleCat = "Breakfast";
List<String> optionsScheduleCat = [
  "Breakfast",
  "Lunch",
  "Dinner",
];

String slctScheduleDay = "Monday";
List<String> optionsScheduleDay = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday",
];

String slctConsumeFilterOrder = "Desc";
List<String> optionsConsumeFilterOrder = [
  "Asc",
  "Desc",
];

String slctConsumeFilterLimit = "10";
List<String> optionsConsumeFilterLimit = ["10", "25", "50", "100"];

String slctConsumeFav = "no";
List<String> optionsConsumeFav = [
  "no",
  "yes",
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

List<Map<String, dynamic>> selectedTagConsume = [];
List<Map<String, dynamic>> selectedTagConsumeList = [];
List<String> selectedProvideList = [];
List<Map<String, dynamic>> provideList = [];

List<Map<String, dynamic>> tagListDummy = [
  {"slug_name": "cheap", "tag_name": "Cheap"},
  {"slug_name": "tasty", "tag_name": "Tasty"},
  {"slug_name": "chocolate", "tag_name": "Chocolate"},
  {"slug_name": "healthy", "tag_name": "Healthy"},
  {"slug_name": "expensive", "tag_name": "Expensive"},
  {"slug_name": "fruit", "tag_name": "Fruit"},
  {"slug_name": "salad", "tag_name": "Salad"},
  {"slug_name": "fast-food", "tag_name": "Fast Food"},
  {"slug_name": "cafein", "tag_name": "Cafein"},
];

String slctGender = "male";
List<String> optionsGender = [
  "male",
  "female",
];

var tabcolHistoryConsume = [
  {"title": "All", "class": GetAllConsumeWPagination(type: "All")},
  {"title": "Food", "class": GetAllConsumeWPagination(type: "Food")},
  {"title": "Drink", "class": GetAllConsumeWPagination(type: "Drink")},
  {"title": "Snack", "class": GetAllConsumeWPagination(type: "Snack")}
];

var tabcolStatistic = [
  {"title": "Consume", "class": StatisticTabs(type: "consume")},
  {"title": "Spending", "class": StatisticTabs(type: "spending")},
  {"title": "Health", "class": StatisticTabs(type: "health")},
  {"title": "Budget", "class": StatisticTabs(type: "budget")}
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
int pageConsume = 1;
int monthCalendar = getDateNowInt("month");
int yearCalendar = getDateNowInt("year");

// Class and object
class UserMiniProfile {
  final String username;
  final String image;
  final String gender;

  UserMiniProfile({this.username, this.image, this.gender});
}
