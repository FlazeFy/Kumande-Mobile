import 'package:flutter/material.dart';

Widget getInputLabel(title, clr, size) {
  return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(title,
          style: TextStyle(
              color: clr, fontSize: size, fontWeight: FontWeight.w500)));
}
