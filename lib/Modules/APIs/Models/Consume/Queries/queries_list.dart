import 'dart:convert';

// Usecase get all consume list
class QueriesConsumeListModel {
  String id;
  String slugName;
  String listName;
  String listDesc;

  // Array
  var listTag; // Nullable

  // Properties
  String createdAt;
  String updatedAt;

  QueriesConsumeListModel(
      {this.id,
      this.slugName,
      this.listName,
      this.listDesc,
      this.listTag,
      this.createdAt,
      this.updatedAt});

  factory QueriesConsumeListModel.fromJson(Map<String, dynamic> map) {
    return QueriesConsumeListModel(
      id: map["id"],
      slugName: map["slug_name"],
      listName: map["list_name"],
      listDesc: map["list_desc"],
      listTag: map["list_tag"],
      createdAt: map["created_at"],
      updatedAt: map["updated_at"],
    );
  }
}

List<QueriesConsumeListModel> queriesConsumeListModelFromJsonWPaginate(
    String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesConsumeListModel>.from(data['data']['data']
      .map((item) => QueriesConsumeListModel.fromJson(item)));
}
