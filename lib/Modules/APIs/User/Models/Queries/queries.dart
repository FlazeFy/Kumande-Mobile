import 'dart:convert';

// Usecase get my profile
class UserProfileModel {
  String fullname;
  String password;
  String email;
  String gender;
  String bornAt;
  String createdAt;
  String updatedAt; // Nullable

  UserProfileModel(
      {this.fullname,
      this.password,
      this.email,
      this.gender,
      this.bornAt,
      this.createdAt,
      this.updatedAt});

  factory UserProfileModel.fromJson(Map<String, dynamic> map) {
    return UserProfileModel(
      fullname: map["fullname"],
      password: map["password"],
      email: map["email"],
      gender: map["gender"],
      bornAt: map["born_at"],
      createdAt: map["created_at"],
      updatedAt: map["updated_at"],
    );
  }
}

List<UserProfileModel> userProfileModelFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<UserProfileModel>.from(
      data['data'].map((item) => UserProfileModel.fromJson(item)));
}
