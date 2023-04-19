import 'package:flutter/material.dart';
import 'package:kumande/Components/Forms/button.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/Variables/style.dart';

// Show onlu
Widget generateTagShow(list) {
  if (list.isNotEmpty) {
    return Wrap(
        runSpacing: -5,
        spacing: 5,
        children: list.map<Widget>((tag) {
          return ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              backgroundColor: MaterialStatePropertyAll<Color>(primaryBg),
            ),
            child: Text(tag['tag_name'],
                style: TextStyle(fontSize: textSm, color: whiteBg)),
          );
        }).toList());
  } else {
    return SizedBox();
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
      getInputLabel("Selected Tag", primaryBg, textLg),
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
