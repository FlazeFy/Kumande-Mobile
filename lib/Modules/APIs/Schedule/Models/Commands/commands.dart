import 'dart:convert';

// Usecase add schedule
class AddScheduleModel {
  String fireId;
  String tokenFCM;
  String scheduleConsume;
  String consumeType;
  String scheduleDesc; // Nullable

  // Array
  var consumeDetail;
  var scheduleTag;
  var scheduleTime;

  AddScheduleModel(
      {this.fireId,
      this.tokenFCM,
      this.scheduleConsume,
      this.consumeType,
      this.scheduleDesc,
      this.consumeDetail,
      this.scheduleTag,
      this.scheduleTime});

  Map<String, dynamic> toJson() {
    return {
      "firebase_id": fireId,
      "token_fcm": tokenFCM,
      "schedule_consume": scheduleConsume,
      "consume_type": consumeType,
      "consume_detail": consumeDetail,
      "schedule_desc": scheduleDesc,
      "schedule_tag": scheduleTag,
      "schedule_time": scheduleTime
    };
  }
}

String addScheduleModelToJson(AddScheduleModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
