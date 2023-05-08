import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Models/User/Commands/commands.dart';

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
}
