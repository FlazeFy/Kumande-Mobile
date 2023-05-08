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

String convertPriceK(val) {
  String res = NumberFormat.compact().format(val).toString();

  return res;
}

String limitString(String str, int maxLength) {
  if (str.length < maxLength) {
    return str;
  } else {
    return "${str.substring(0, maxLength)}...";
  }
}

String ucFirst(String val) {
  String res = val[0].toUpperCase() + val.substring(1);

  return res;
}

int convertFavorite(String val) {
  int res;
  if (val == "yes") {
    res = 1;
  } else {
    res = 0;
  }

  return res;
}

// Make this multi response
String getMessageResponseFromObject(val) {
  var res = "";

  if (val is String) {
    return val;
  } else {
    if (val.containsKey('username') != null) {
      var unameErr = val['username'];

      if (unameErr != null) {
        res += "${unameErr.join('\n')}";
      }
    }
    if (val.containsKey('fullname') != null) {
      var fnameErr = val['fullname'];

      if (fnameErr != null) {
        res += "${fnameErr.join('\n')}";
      }
    }
    if (val.containsKey('password')) {
      var passErr = val['password'];
      if (passErr != null) {
        res += "${passErr.join('\n')}";
      }
    }
    if (val.containsKey('email') != null) {
      var emailErr = val['email'];

      if (emailErr != null) {
        res += "${emailErr.join('\n')}";
      }
    }
    if (val.containsKey('firebase_id') != null) {
      var fireIdErr = val['firebase_id'];

      if (fireIdErr != null) {
        res += "${fireIdErr.join('\n')}";
      }
    }
    if (val.containsKey('gender') != null) {
      var genderErr = val['gender'];

      if (genderErr != null) {
        res += "${genderErr.join('\n')}";
      }
    }
    if (val.containsKey('image_url') != null) {
      var imgUrlErr = val['image_url'];

      if (imgUrlErr != null) {
        res += "${imgUrlErr.join('\n')}";
      }
    }
    if (val.containsKey('born_at') != null) {
      var bornErr = val['born_at'];

      if (bornErr != null) {
        res += "${bornErr.join('\n')}";
      }
    }
    if (val.containsKey('list_name') != null) {
      var lsname = val['list_name'];

      if (lsname != null) {
        res += "${lsname.join('\n')}";
      }
    }
    if (val.containsKey('list_desc') != null) {
      var lsdesc = val['list_desc'];

      if (lsdesc != null) {
        res += "${lsdesc.join('\n')}";
      }
    }
    if (val.containsKey('list_desc') != null) {
      var lsdesc = val['list_desc'];

      if (lsdesc != null) {
        res += "${lsdesc.join('\n')}";
      }
    }
    if (val.containsKey('consume_name') != null) {
      var csmName = val['consume_name'];

      if (csmName != null) {
        res += "${csmName.join('\n')}";
      }
    }
    if (val.containsKey('consume_comment') != null) {
      var csmComment = val['consume_comment'];

      if (csmComment != null) {
        res += "${csmComment.join('\n')}";
      }
    }
    if (val.containsKey('payment_price') != null) {
      var csmPrice = val['payment_price'];

      if (csmPrice != null) {
        res += "${csmPrice.join('\n')}";
      }
    }
    if (val.containsKey('schedule_consume') != null) {
      var schConsume = val['schedule_consume'];

      if (schConsume != null) {
        res += "${schConsume.join('\n')}";
      }
    }
    if (val.containsKey('schedule_desc') != null) {
      var schdesc = val['schedule_desc'];

      if (schdesc != null) {
        res += "${schdesc.join('\n')}";
      }
    }
    return res;
  }
}
