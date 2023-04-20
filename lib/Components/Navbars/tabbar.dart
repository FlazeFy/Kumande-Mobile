import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/style.dart';

Widget getTabBar(height, ctrl, title, titleColor, col) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(
        margin: EdgeInsets.only(left: 10),
        child: Text(title,
            style: TextStyle(
                color: titleColor, fontSize: 20, fontWeight: FontWeight.bold))),
    Container(
      margin: const EdgeInsets.only(top: 10),
      child: TabBar(
          controller: ctrl,
          labelColor: textSecondary,
          indicatorColor: primaryBg,
          labelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          indicatorPadding: EdgeInsets.zero,
          tabs: List.generate(col.length, (index) {
            return Tab(text: col[index]['title']);
          })),
    ),
    SizedBox(
      height: height * 0.8,
      child: TabBarView(
        controller: ctrl,
        children: List.generate(col.length, (index) {
          return col[index]['class'];
        }),
      ),
    )
  ]);
}
