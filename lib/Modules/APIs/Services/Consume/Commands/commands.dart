import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Models/Consume/Commands/commands.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConsumeCommandsService {
  final String baseUrl = "http://10.0.2.2:8000";
  Client client = Client();

  Future<List<Map<String, dynamic>>> addConsume(AddConsumeModel data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'content-type': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.post(
      Uri.parse("$baseUrl/api/v1/consume/create"),
      headers: header,
      body: AddConsumeModelToJson(data),
    );

    var responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return [
        {
          "status": responseData['status'],
          "message": responseData['message'],
          "data": responseData['data']
        }
      ];
    } else if (response.statusCode == 422) {
      // Validation failed
      return [
        {
          "message": responseData['message'],
          "status": responseData['status'],
          "data": null
        }
      ];
    } else {
      // Check this shit
      return [
        {
          "message": responseData['message'],
          "status": responseData['status'],
          "data": null
        }
      ];
    }
  }
}
