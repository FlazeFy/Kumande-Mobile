import 'dart:convert';

// Usecase add consume
class AddConsumeModel {
  String consumeType;
  String consumeName;
  var consumeDetail; // Array
  String consumeFrom;
  int isFavorite; // Bool
  var consumeTag; // Array
  String consumeComment;
  String paymentMethod;
  int paymentPrice;
  int isPayment; // Bool

  AddConsumeModel(
      {this.consumeType,
      this.consumeName,
      this.consumeDetail,
      this.consumeFrom,
      this.isFavorite,
      this.consumeTag,
      this.consumeComment,
      this.paymentMethod,
      this.paymentPrice,
      this.isPayment});

  Map<String, dynamic> toJson() {
    return {
      "consume_type": consumeType,
      "consume_name": consumeName,
      "consume_detail": consumeDetail,
      "consume_from": consumeFrom,
      "is_favorite": 0, // For now
      "consume_tag": consumeTag,
      "consume_comment": consumeComment,
      "payment_method": paymentMethod,
      "payment_price": paymentPrice,
      "is_payment": 1 // For now
    };
  }
}

String AddConsumeModelToJson(AddConsumeModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
