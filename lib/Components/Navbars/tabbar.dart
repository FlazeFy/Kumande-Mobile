import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/MainMenus/HistoryPage/Usecases/getAllConsumeWPagination.dart';

Widget getTabBar(height, ctrl, title, titleColor) {
  return Column(children: [
    Text(title,
        style: TextStyle(
            color: titleColor, fontSize: 20, fontWeight: FontWeight.bold)),
    Container(
      margin: const EdgeInsets.only(top: 10),
      child: TabBar(
        controller: ctrl,
        labelColor: textSecondary,
        indicatorColor: primaryBg,
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        indicatorPadding: EdgeInsets.zero,
        tabs: const <Widget>[
          Tab(
            text: "All",
          ),
          Tab(
            text: "Food",
          ),
          Tab(
            text: "Drink",
          ),
          Tab(
            text: "Snack",
          ),
        ],
      ),
    ),
    SizedBox(
      height: height * 0.7,
      child: TabBarView(
        controller: ctrl,
        children: [
          GetAllConsumeWPagination(),
          Column(
            children: const [],
          ),
          Column(
            children: const [],
          ),
          Column(
            children: const [],
          ),
        ],
      ),
    )
  ]);
}
