import 'dart:convert';

// Usecase add consume
class AddConsumeModel {
  String consumeType;
  String consumeName;
  String fireId;
  String tokenFCM;
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
      this.fireId,
      this.tokenFCM,
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
      "firebase_id": fireId,
      "token_fcm": tokenFCM,
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

String addConsumeModelToJson(AddConsumeModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
