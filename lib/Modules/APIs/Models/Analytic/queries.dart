import 'dart:convert';

// Usecase get analytic (multi modules)
class QueriesMultiAnalyticModel {
  int average;
  int min;
  int max;
  int total;

  QueriesMultiAnalyticModel({this.average, this.min, this.max, this.total});

  factory QueriesMultiAnalyticModel.fromJson(Map<String, dynamic> map) {
    return QueriesMultiAnalyticModel(
      average: map["average"],
      min: map["min"],
      max: map["max"],
      total: map["total"],
    );
  }
}

List<QueriesMultiAnalyticModel> QueriesMultiAnalyticModelFromJson(
    String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesMultiAnalyticModel>.from(
      data['data'].map((item) => QueriesMultiAnalyticModel.fromJson(item)));
}
