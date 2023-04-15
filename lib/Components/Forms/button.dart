import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';

Widget getButtonTag(title, Function onPress, call, res, bool isDeleted) {
  return ElevatedButton(
    onPressed: () {
      if (res == "tag_consume") {
        if (selectedTagConsume.isNotEmpty) {
          if (!selectedTagConsume.contains(title) ||
              !tagListDummy.contains(title)) {
            if (isDeleted) {
              onPress(tagListDummy.add(title));
              onPress(selectedTagConsume.removeWhere((item) => item == title));
            } else {
              onPress(tagListDummy.removeWhere((item) => item == title));
              onPress(selectedTagConsume.add(title));
            }
          }
        } else {
          if (isDeleted) {
            onPress(tagListDummy.add(title));
            onPress(selectedTagConsume.removeWhere((item) => item == title));
          } else {
            onPress(tagListDummy.removeWhere((item) => item == title));
            onPress(selectedTagConsume.add(title));
          }
        }
      } else if (res == "tag_consume_list") {
        if (selectedTagConsumeList.isNotEmpty) {
          if (!selectedTagConsumeList.contains(title) ||
              !tagListDummy.contains(title)) {
            if (isDeleted) {
              onPress(tagListDummy.add(title));
              onPress(
                  selectedTagConsumeList.removeWhere((item) => item == title));
            } else {
              onPress(tagListDummy.removeWhere((item) => item == title));
              onPress(selectedTagConsumeList.add(title));
            }
          }
        } else {
          if (isDeleted) {
            onPress(tagListDummy.add(title));
            onPress(
                selectedTagConsumeList.removeWhere((item) => item == title));
          } else {
            onPress(tagListDummy.removeWhere((item) => item == title));
            onPress(selectedTagConsumeList.add(title));
          }
        }
      }

      refreshPage(call);
    },
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      backgroundColor: MaterialStatePropertyAll<Color>(primaryBg),
    ),
    child: Text(title, style: TextStyle(fontSize: textSm)),
  );
}

void refreshPage(Function refreshCallback) {
  refreshCallback();
}
