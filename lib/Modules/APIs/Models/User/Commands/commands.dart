import 'dart:convert';

// Usecase add consume
class AddUserModel {
  String firebaseId;
  String fullname;
  String username;
  String email;
  String password;
  String gender;
  var imageURL; //Nullable
  String dateBorn;

  AddUserModel(
      {this.firebaseId,
      this.fullname,
      this.username,
      this.email,
      this.password,
      this.gender,
      this.imageURL,
      this.dateBorn});

  Map<String, dynamic> toJson() {
    return {
      "firebase_id": firebaseId,
      "fullname": fullname,
      "username": username,
      "email": email,
      "password": password,
      "gender": gender,
      "image_url": imageURL,
      "born_at": dateBorn
    };
  }
}

String addUserModelToJson(AddUserModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
