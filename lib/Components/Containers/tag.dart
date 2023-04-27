import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/style.dart';

Widget getTagWhite(String tag, double textSize) {
  return Container(
      margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
      padding: EdgeInsets.symmetric(
          vertical: paddingContentSM / 2, horizontal: paddingContentSM),
      decoration: BoxDecoration(
          color: whiteBg,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Text(tag,
          style: TextStyle(
              color: primaryBg,
              fontSize: textSize,
              fontWeight: FontWeight.w500)));
}
