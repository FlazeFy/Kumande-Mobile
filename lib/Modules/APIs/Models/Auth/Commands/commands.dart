import 'dart:convert';

// Usecase login
class LoginModel {
  String email;
  String password;

  LoginModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}

String LoginModelToJson(LoginModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
