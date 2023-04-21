import 'dart:convert';

// Usecase get today schedule
class QueriesTodayScheduleModel {
  String scheduleCode;
  String scheduleConsume;
  String consumeType;

  // Array
  var scheduleTime;
  var consumeDetail; // Nullable

  QueriesTodayScheduleModel(
      {this.scheduleCode,
      this.scheduleConsume,
      this.consumeType,
      this.scheduleTime,
      this.consumeDetail});

  factory QueriesTodayScheduleModel.fromJson(Map<String, dynamic> map) {
    return QueriesTodayScheduleModel(
      scheduleCode: map["schedule_code"],
      scheduleConsume: map["schedule_consume"],
      scheduleTime: map["schedule_time"],
      consumeType: map["consume_type"],
      consumeDetail: map["consume_detail"],
    );
  }
}

List<QueriesTodayScheduleModel> QueriesTodayScheduleModelFromJson(
    String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesTodayScheduleModel>.from(
      data['data'].map((item) => QueriesTodayScheduleModel.fromJson(item)));
}
