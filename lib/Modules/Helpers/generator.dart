import 'package:flutter/material.dart';
import 'package:kumande/Components/Forms/button.dart';
import 'package:kumande/Modules/Variables/style.dart';

Widget generateTag(list, call, res) {
  return Wrap(
      runSpacing: -5,
      spacing: 5,
      children: list.map<Widget>((tag) {
        return getButtonTag(tag, (p0) => null, call, res);
      }).toList());
}
