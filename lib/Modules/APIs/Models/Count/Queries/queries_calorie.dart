import 'dart:convert';

// Usecase get last count body
class QueriesCountCalorieModel {
  int weight;
  int height;
  int result;
  String date;

  QueriesCountCalorieModel({this.weight, this.height, this.result, this.date});

  factory QueriesCountCalorieModel.fromJson(Map<String, dynamic> map) {
    return QueriesCountCalorieModel(
      weight: map["weight"],
      height: map["height"],
      result: map["result"],
      date: map["created_at"],
    );
  }
}

List<QueriesCountCalorieModel> queriesCountCalorieModelFromJson(
    String jsonData) {
  final data = json.decode(jsonData);
  return List<QueriesCountCalorieModel>.from(
      data['data'].map((item) => QueriesCountCalorieModel.fromJson(item)));
}
