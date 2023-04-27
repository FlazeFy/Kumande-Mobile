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

// Usecase get my schedule
class QueriesMyScheduleModel {
  String scheduleConsume;
  String day;
  String time;

  QueriesMyScheduleModel({this.scheduleConsume, this.day, this.time});

  factory QueriesMyScheduleModel.fromJson(Map<String, dynamic> map) {
    return QueriesMyScheduleModel(
      scheduleConsume: map["schedule_consume"],
      day: map["day"],
      time: map["time"],
    );
  }
}

List<QueriesMyScheduleModel> QueriesMyScheduleModelFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesMyScheduleModel>.from(
      data['data'].map((item) => QueriesMyScheduleModel.fromJson(item)));
}
