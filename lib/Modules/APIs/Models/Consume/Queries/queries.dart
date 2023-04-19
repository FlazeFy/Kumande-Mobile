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
  int paymentPrice;

  // Array
  var consumeDetail;
  var consumePayment;
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
      this.consumePayment,
      this.consumeTag,
      this.createdAt,
      this.paymentPrice});

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
      consumePayment: map["consume_payment"],
      consumeTag: map["consume_tag"],
      createdAt: map["created_at"],
      paymentPrice: map["payment_price"],
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
class QueriesConsumeFromTotalModel {
  String consumeFrom;
  int total;

  QueriesConsumeFromTotalModel({this.consumeFrom, this.total});

  factory QueriesConsumeFromTotalModel.fromJson(Map<String, dynamic> map) {
    return QueriesConsumeFromTotalModel(
      consumeFrom: map["consume_from"],
      total: map["total"],
    );
  }
}

List<QueriesConsumeFromTotalModel> QueriesConsumeFromTotalModelFromJson(
    String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesConsumeFromTotalModel>.from(
      data['data'].map((item) => QueriesConsumeFromTotalModel.fromJson(item)));
}
