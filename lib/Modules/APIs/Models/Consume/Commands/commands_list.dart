import 'dart:convert';

// Usecase add consume list
class AddConsumeListModel {
  String listName;
  String listDesc;
  String fireId;
  var listTag; // Array

  AddConsumeListModel(
      {this.listName, this.fireId, this.listDesc, this.listTag});

  Map<String, dynamic> toJson() {
    return {
      "firebase_id": fireId,
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
