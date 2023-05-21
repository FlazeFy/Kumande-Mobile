import 'dart:convert';

// Usecase add user
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

// Usecase edit user
class EditUserModel {
  String fullname;
  String password;
  String gender;
  String dateBorn;

  EditUserModel({this.fullname, this.password, this.gender, this.dateBorn});

  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "password": password,
      "gender": gender,
      "born_at": dateBorn
    };
  }
}

String editUserModelToJson(EditUserModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

// Usecase edit user image
class EditUserImageModel {
  String imageUrl;

  EditUserImageModel({this.imageUrl});

  Map<String, dynamic> toJson() {
    return {
      "image_url": imageUrl,
    };
  }
}

String editUserImageModelToJson(EditUserImageModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
