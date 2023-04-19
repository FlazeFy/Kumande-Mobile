import 'package:intl/intl.dart';

getIsNull(val) {
  if (val != null) {
    return val;
  } else {
    return " ";
  }
}

getPriceIsNull(val) {
  if (val != null) {
    var result = NumberFormat.compact().format(val);

    return "Rp. $result";
  } else {
    return "Free";
  }
}
