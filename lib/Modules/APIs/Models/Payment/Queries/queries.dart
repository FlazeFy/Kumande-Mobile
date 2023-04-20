import 'dart:convert';

// Usecase get total consume by from
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

List<QueriesPaymentLineChartModel> QueriesPaymentLineChartModelFromJson(
    String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesPaymentLineChartModel>.from(
      data['data'].map((item) => QueriesPaymentLineChartModel.fromJson(item)));
}
