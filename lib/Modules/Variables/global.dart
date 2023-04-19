// Chart
import 'package:kumande/Pages/MainMenus/HistoryPage/Usecases/GetAllConsumeWPagination.dart';

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

// Navigation
int page = 0;
