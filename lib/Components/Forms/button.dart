import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';

Widget getButtonTag(title, Function onPress, call, res, bool isDeleted) {
  return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: ElevatedButton(
        onPressed: () {
          if (res == "tag_consume") {
            if (selectedTagConsume.isNotEmpty) {
              if (!selectedTagConsume.contains(title) ||
                  !tagListDummy.contains(title)) {
                if (isDeleted) {
                  onPress(tagListDummy.add(title));
                  onPress(
                      selectedTagConsume.removeWhere((item) => item == title));
                } else {
                  onPress(tagListDummy.removeWhere((item) => item == title));
                  onPress(selectedTagConsume.add(title));
                }
              }
            } else {
              if (isDeleted) {
                onPress(tagListDummy.add(title));
                onPress(
                    selectedTagConsume.removeWhere((item) => item == title));
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
                  onPress(selectedTagConsumeList
                      .removeWhere((item) => item == title));
                } else {
                  onPress(tagListDummy.removeWhere((item) => item == title));
                  onPress(selectedTagConsumeList.add(title));
                }
              }
            } else {
              if (isDeleted) {
                onPress(tagListDummy.add(title));
                onPress(selectedTagConsumeList
                    .removeWhere((item) => item == title));
              } else {
                onPress(tagListDummy.removeWhere((item) => item == title));
                onPress(selectedTagConsumeList.add(title));
              }
            }
          } else if (res == "tag_consume_filter") {
            if (selectedProvideList.isNotEmpty) {
              if (!selectedProvideList.contains(title) ||
                  !provideList.contains(title)) {
                if (isDeleted) {
                  onPress(provideList.add(title));
                  onPress(
                      selectedProvideList.removeWhere((item) => item == title));
                } else {
                  onPress(provideList.removeWhere((item) => item == title));
                  onPress(selectedProvideList.add(title));
                }
              }
            } else {
              if (isDeleted) {
                onPress(provideList.add(title));
                onPress(
                    selectedProvideList.removeWhere((item) => item == title));
              } else {
                onPress(provideList.removeWhere((item) => item == title));
                onPress(selectedProvideList.add(title));
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
      ));
}

void refreshPage(Function refreshCallback) {
  refreshCallback();
}
