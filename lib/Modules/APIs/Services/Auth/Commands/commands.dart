import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Models/Auth/Commands/commands.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCommandsService {
  final String baseUrl = "http://10.0.2.2:8000";
  Client client = Client();

  Future<List<Map<String, dynamic>>> addLogin(LoginModel data) async {
    final response = await client.post(
      Uri.parse("$baseUrl/api/v1/login"),
      headers: {"content-type": "application/json"},
      body: loginModelToJson(data),
    );

    var responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token_key', responseData['token']);
      await prefs.setString('id_key', responseData['result']['id']);
      await prefs.setString('username_key', responseData['result']['username']);
      await prefs.setString(
          'image_key', responseData['result']['image_url'].toString());
      await prefs.setString('gender_key', responseData['result']['gender']);

      return [
        {
          "message": "success",
          "body": responseData['result'],
          "token": responseData['token']
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
}
