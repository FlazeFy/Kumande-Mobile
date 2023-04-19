import 'package:flutter/material.dart';

getTypeIcon(val) {
  if (val == "Food") {
    return Icons.rice_bowl;
  } else if (val == "Drink") {
    return Icons.coffee;
  } else if (val == "Snack") {
    return Icons.cake;
  }
}
