import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kumande/Components/Forms/button.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:intl/intl.dart';

// Show only
Widget generateTagShow(list) {
  if (list != null && list.isNotEmpty) {
    return Wrap(
        runSpacing: -5,
        spacing: 5,
        children: list.map<Widget>((tag) {
          return Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  backgroundColor: MaterialStatePropertyAll<Color>(primaryBg),
                ),
                onPressed: () {},
                child: Text(tag['tag_name'],
                    style: TextStyle(fontSize: textSm, color: whiteBg)),
              ));
        }).toList());
  } else {
    return const SizedBox();
  }
}

Widget generateConsumeDetail(list) {
  return Wrap(runSpacing: -5, spacing: 5, children: [
    ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        backgroundColor: MaterialStatePropertyAll<Color>(successBg),
      ),
      onPressed: () {},
      child: Text(list[0]['provide'],
          style: TextStyle(fontSize: textSm, color: whiteBg)),
    ),
    ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        backgroundColor: MaterialStatePropertyAll<Color>(warningBg),
      ),
      onPressed: () {},
      child: Text(" ${list[0]['calorie']} Cal",
          style: TextStyle(fontSize: textSm, color: whiteBg)),
    ),
    ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        backgroundColor: MaterialStatePropertyAll<Color>(dangerBg),
      ),
      onPressed: () {},
      child: Text(list[0]['main_ing'],
          style: TextStyle(fontSize: textSm, color: whiteBg)),
    ),
  ]);
}

// For interact
Widget generateTag(list, call, res) {
  return Wrap(
      runSpacing: -5,
      spacing: 5,
      children: list.map<Widget>((tag) {
        return getButtonTag(tag, (p0) => null, call, res, false);
      }).toList());
}

Widget generateSelectedTag(list, call, res) {
  if (list.isNotEmpty) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      getInputLabel("Selected Tag", textPrimary, textSm),
      Wrap(
          runSpacing: -5,
          spacing: 5,
          children: list.map<Widget>((tag) {
            return getButtonTag(tag, (p0) => null, call, res, true);
          }).toList())
    ]);
  } else {
    return const SizedBox();
  }
}

String getTodayDayString(int i) {
  if (i != null) {
    DateTime now = DateTime.now().add(Duration(days: i));
    String day = DateFormat('E').format(now);
    return day;
  } else {
    DateTime now = DateTime.now();
    String day = DateFormat('E').format(now);
    return day;
  }
}

getDateNowInt(String type) {
  var now = DateTime.now();
  if (type == "year") {
    return now.year;
  } else if (type == "month") {
    return now.month;
  } else if (type == "day") {
    return now.day;
  }
}

String getDateText(DateTime date, String type, String view) {
  if (view == "datetime") {
    if (date != null) {
      return DateFormat("dd-MM-yy HH:mm").format(date).toString();
    } else {
      return "Set Date $type";
    }
  } else if (view == "date") {
    if (date != null) {
      return DateFormat("dd-MM-yy").format(date).toString();
    } else {
      return "Set Date $type";
    }
  } else if (view == "datev2") {
    if (date != null) {
      return DateFormat("yyyy-MM-dd").format(date).toString();
    } else {
      return "Set Date $type";
    }
  } else if (view == "time") {
    if (date != null) {
      return DateFormat("HH:mm").format(date).toString();
    } else {
      return "Set Time $type";
    }
  } else if (view == "month") {
    if (date != null) {
      return DateFormat("MMM").format(date).toString();
    } else {
      return "Set Time $type";
    }
  }
}

String getRandomString(int length) {
  var chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();

  String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

  return chars;
}
