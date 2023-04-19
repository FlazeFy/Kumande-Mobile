import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:kumande/Modules/Variables/style.dart';

Widget getInputTextMain(ctrl, String title, int len) {
  return Container(
    padding: EdgeInsets.zero,
    child: TextFormField(
      cursorColor: Colors.white,
      controller: ctrl,
      maxLength: len,
      style: TextStyle(fontSize: textSm),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          hintText: title,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: primaryBg),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2.5, color: successBg),
          ),
          fillColor: Colors.white,
          filled: true),
    ),
  );
}

Widget getInputDescMain(ctrl, String title, int len, int min, int max) {
  return Container(
    padding: EdgeInsets.zero,
    child: TextFormField(
      cursorColor: Colors.white,
      controller: ctrl,
      maxLength: len,
      minLines: min,
      maxLines: max,
      style: TextStyle(fontSize: textSm),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          hintText: title,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: primaryBg),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2.5, color: successBg),
          ),
          fillColor: Colors.white,
          filled: true),
    ),
  );
}

Widget getInputNumberMain(
    ctrl, String title, double min, double max, double init) {
  return Container(
    padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
    child: SpinBox(
      min: min,
      max: max,
      value: init,
      spacing: 1,
      textStyle: TextStyle(
        fontSize: textSm,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          labelText: title,
          hintText: title,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: primaryBg),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2.5, color: successBg),
          ),
          fillColor: Colors.white,
          filled: true),
    ),
  );
}

Widget getDropDownMain(
    String slct, List<String> opt, Function(String) onChanged) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 45,
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryBg, // Set the border color
          width: 1.0, // Set the border width
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
        value: slct,
        underline: Container(
          height: 1.0,
          decoration: const BoxDecoration(border: null),
        ),
        style: TextStyle(fontSize: textSm, color: textPrimary),
        items: opt.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ));
}
