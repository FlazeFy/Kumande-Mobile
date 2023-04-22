import 'dart:convert';

// Usecase get all consume
class QueriesConsumeModel {
  String id;
  String slugName;
  String consumeType;
  String consumeName;
  String consumeFrom;
  String consumeComment;
  int consumeFavorite;
  int consumePrice;

  // Array
  var consumeDetail;
  var consumeConsume;
  var consumeTag; // Nullable

  // Properties
  String createdAt;

  QueriesConsumeModel(
      {this.id,
      this.slugName,
      this.consumeType,
      this.consumeName,
      this.consumeFrom,
      this.consumeComment,
      this.consumeFavorite,
      this.consumeDetail,
      this.consumeConsume,
      this.consumeTag,
      this.createdAt,
      this.consumePrice});

  factory QueriesConsumeModel.fromJson(Map<String, dynamic> map) {
    return QueriesConsumeModel(
      id: map["id"],
      slugName: map["slug_name"],
      consumeType: map["consume_type"],
      consumeName: map["consume_name"],
      consumeFrom: map["consume_from"],
      consumeComment: map["consume_comment"],
      consumeFavorite: map["consume_favorite"],
      consumeDetail: map["consume_detail"],
      consumeConsume: map["consume_Consume"],
      consumeTag: map["consume_tag"],
      createdAt: map["created_at"],
      consumePrice: map["Consume_price"],
    );
  }
}

List<QueriesConsumeModel> QueriesConsumeModelFromJsonWPaginate(
    String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesConsumeModel>.from(
      data['data']['data'].map((item) => QueriesConsumeModel.fromJson(item)));
}

// Usecase get total consume by from
class QueriesConsumePieChartModel {
  String ctx;
  int total;

  QueriesConsumePieChartModel({this.ctx, this.total});

  factory QueriesConsumePieChartModel.fromJson(Map<String, dynamic> map) {
    return QueriesConsumePieChartModel(
      ctx: map["context"],
      total: map["total"],
    );
  }
}

List<QueriesConsumePieChartModel> QueriesConsumePieChartModelFromJson(
    String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesConsumePieChartModel>.from(
      data['data'].map((item) => QueriesConsumePieChartModel.fromJson(item)));
}

// Usecase get total daily Consume by cal
class QueriesConsumeLineChartModel {
  String ctx;
  int total;

  QueriesConsumeLineChartModel({this.ctx, this.total});

  factory QueriesConsumeLineChartModel.fromJson(Map<String, dynamic> map) {
    return QueriesConsumeLineChartModel(
      ctx: map["context"],
      total: map["total"],
    );
  }
}

List<QueriesConsumeLineChartModel> QueriesConsumeLineChartModelFromJson(
    String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesConsumeLineChartModel>.from(
      data['data'].map((item) => QueriesConsumeLineChartModel.fromJson(item)));
}
