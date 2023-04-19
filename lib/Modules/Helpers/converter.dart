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
