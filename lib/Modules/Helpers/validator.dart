import 'package:intl/intl.dart';

validateDate(DateTime date) {
  if (date != null) {
    return DateFormat("yyyy-MM-dd").format(date).toString();
  } else {
    return "null";
  }
}

validateTime(DateTime date) {
  if (date != null) {
    return DateFormat("HH:mm").format(date).toString();
  } else {
    return "null";
  }
}
