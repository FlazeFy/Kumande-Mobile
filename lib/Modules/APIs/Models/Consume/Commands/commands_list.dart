import 'dart:convert';

// Usecase add consume list
class AddConsumeListModel {
  String listName;
  String listDesc;
  String fireId;
  String tokenFCM;
  var listTag; // Array

  AddConsumeListModel(
      {this.listName, this.tokenFCM, this.fireId, this.listDesc, this.listTag});

  Map<String, dynamic> toJson() {
    return {
      "firebase_id": fireId,
      "token_fcm": tokenFCM,
      "list_name": listName,
      "list_desc": listDesc,
      "list_tag": listTag
    };
  }
}

String addConsumeListModelToJson(AddConsumeListModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
