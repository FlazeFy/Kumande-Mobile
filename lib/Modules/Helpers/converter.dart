import 'dart:convert';

import 'package:intl/intl.dart';

getIsNull(val) {
  if (val != null) {
    return val;
  } else {
    return " ";
  }
}

String getPriceIsNull(val) {
  if (val != null) {
    var result = NumberFormat.compact().format(val);

    return "Rp. $result";
  } else {
    return "Free";
  }
}

String limitString(String str, int maxLength) {
  if (str.length < maxLength) {
    return str;
  } else {
    return "${str.substring(0, maxLength)}...";
  }
}

String getMessageResponseFromObject(val) {
  var res = "";

  if (val is String) {
    return val;
  } else {
    var usernameErr = val['username'];
    var passErr = val['password'];

    if (usernameErr != null) {
      res += "${usernameErr.join('\n')}";
    }
    if (passErr != null) {
      res += "${passErr.join('\n')}";
    }

    return res;
  }
}
