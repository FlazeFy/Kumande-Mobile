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

// Usecase spending info
class QueriesSpendLifeModel {
  int total;
  int days;

  QueriesSpendLifeModel({this.total, this.days});

  factory QueriesSpendLifeModel.fromJson(Map<String, dynamic> map) {
    return QueriesSpendLifeModel(
        days: map["total_days"], total: map["total_payment"]);
  }
}

List<QueriesSpendLifeModel> QueriesSpendLifeModelFromJSON(String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesSpendLifeModel>.from(
      data['data'].map((item) => QueriesSpendLifeModel.fromJson(item)));
}
