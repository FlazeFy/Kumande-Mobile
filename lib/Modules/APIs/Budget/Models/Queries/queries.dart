import 'dart:convert';

// Usecase get all budget in year (Statistic)
class QueriesBudgetLineChartModel {
  String ctx;
  int total;

  QueriesBudgetLineChartModel({this.ctx, this.total});

  factory QueriesBudgetLineChartModel.fromJson(Map<String, dynamic> map) {
    return QueriesBudgetLineChartModel(
      ctx: map["context"],
      total: map["total"],
    );
  }
}

List<QueriesBudgetLineChartModel> queriesBudgetLineChartModelFromJson(
    String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesBudgetLineChartModel>.from(
      data['data'].map((item) => QueriesBudgetLineChartModel.fromJson(item)));
}
