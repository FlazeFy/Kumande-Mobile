import 'dart:convert';

// Usecase get total daily Payment by cal
class QueriesPaymentLineChartModel {
  String ctx;
  int total;

  QueriesPaymentLineChartModel({this.ctx, this.total});

  factory QueriesPaymentLineChartModel.fromJson(Map<String, dynamic> map) {
    return QueriesPaymentLineChartModel(
      ctx: map["context"],
      total: map["total"],
    );
  }
}

List<QueriesPaymentLineChartModel> queriesPaymentLineChartModelFromJson(
    String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesPaymentLineChartModel>.from(
      data['data'].map((item) => QueriesPaymentLineChartModel.fromJson(item)));
}
