import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/User/Models/Commands/commands.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCommandsService {
  final String baseUrl = "http://10.0.2.2:8000";
  Client client = Client();

  Future<List<Map<String, dynamic>>> addUser(AddUserModel data) async {
    final header = {
      'Accept': 'application/json',
      'content-type': 'application/json',
    };

    final response = await client.post(
      Uri.parse("$baseUrl/api/v1/user/create"),
      headers: header,
      body: addUserModelToJson(data),
    );

    var responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return [
        {
          "message": "success",
          "body": responseData['message'],
        }
      ];
    } else if (response.statusCode == 422) {
      // Validation failed
      return [
        {"message": "failed", "body": responseData['result'], "token": null}
      ];
    } else if (response.statusCode == 401) {
      // Wrong username or password
      return [
        {"message": "failed", "body": responseData['message'], "token": null}
      ];
    } else {
      return [
        {"message": "failed", "body": "Unknown error", "token": null}
      ];
    }
  }

  Future<List<Map<String, dynamic>>> editImage(EditUserImageModel data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');

    final header = {
      'Accept': 'application/json',
      'content-type': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.put(
      Uri.parse("$baseUrl/api/v1/user/image"),
      headers: header,
      body: editUserImageModelToJson(data),
    );

    var responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return [
        {
          "message": "success",
          "body": responseData['message'],
        }
      ];
    } else if (response.statusCode == 422) {
      // Validation failed
      return [
        {"message": "failed", "body": responseData['result']}
      ];
    } else if (response.statusCode == 401) {
      // Wrong username or password
      return [
        {"message": "failed", "body": responseData['message']}
      ];
    } else {
      return [
        {"message": "failed", "body": responseData.toString()}
      ];
    }
  }

  Future<List<Map<String, dynamic>>> editUser(EditUserModel data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');

    final header = {
      'Accept': 'application/json',
      'content-type': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.put(
      Uri.parse("$baseUrl/api/v1/user/edit"),
      headers: header,
      body: editUserModelToJson(data),
    );

    var responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return [
        {
          "message": "success",
          "body": responseData['message'],
        }
      ];
    } else if (response.statusCode == 422) {
      // Validation failed
      return [
        {"message": "failed", "body": responseData['result']}
      ];
    } else if (response.statusCode == 401) {
      // Wrong username or password
      return [
        {"message": "failed", "body": responseData['message']}
      ];
    } else {
      return [
        {"message": "failed", "body": "Unknown error"}
      ];
    }
  }
}
