import 'package:intl/intl.dart';

validateDate(DateTime date) {
  if (date != null && date != "null") {
    return DateFormat("yyyy-MM-dd").format(date).toString();
  } else {
    return "null";
  }
}
