import 'package:flutter/material.dart';
import 'package:kumande/Components/Icons/icon.dart';
import 'package:kumande/Modules/Helpers/converter.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/style.dart';

Widget getConsumeHistoryContainer(
    title, price, comment, type, from, detail, tag) {
  return Container(
      padding: EdgeInsets.all(paddingContainerLG),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.35),
            blurRadius: 8.0,
            spreadRadius: 0.0,
            offset: const Offset(
              5.0,
              5.0,
            ),
          )
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Icon(
              getTypeIcon(type),
              color: primaryBg,
              size: iconMD,
              semanticLabel: 'ss',
            ),
            const SizedBox(width: 10),
            Text(limitString(ucFirst(title), 20),
                style: TextStyle(color: primaryBg, fontWeight: titleWeight)),
            const Spacer(),
            Text(from, style: TextStyle(color: textSecondary)),
            const SizedBox(width: 10),
            Text(getPriceIsNull(price),
                style: TextStyle(color: successBg, fontWeight: titleWeight)),
          ],
        ),
        const SizedBox(height: 10),
        Text(getIsNull(comment), style: TextStyle(color: textSecondary)),
        const SizedBox(height: 5),
        generateConsumeDetail(detail),
        generateTagShow(tag)
      ]));
}

Widget getConsumeListContainer(title, desc, tag) {
  return Container(
      padding: EdgeInsets.all(paddingContainerLG),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.35),
            blurRadius: 8.0,
            spreadRadius: 0.0,
            offset: const Offset(
              5.0,
              5.0,
            ),
          )
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(limitString(ucFirst(title), 20),
                style: TextStyle(color: primaryBg, fontWeight: titleWeight)),
          ],
        ),
        const SizedBox(height: 10),
        Text(getIsNull(desc), style: TextStyle(color: textSecondary)),
        const SizedBox(height: 5),
        generateTagShow(tag)
      ]));
}
