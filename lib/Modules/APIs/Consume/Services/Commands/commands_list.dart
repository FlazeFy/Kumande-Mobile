import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Consume/Models/Commands/commands_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConsumeListCommandsService {
  final String baseUrl = "http://10.0.2.2:8000";
  Client client = Client();

  Future<List<Map<String, dynamic>>> addConsumeList(
      AddConsumeListModel data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final tokenFCM = prefs.getString('token_fcm_key');

    data.tokenFCM = tokenFCM;
    final header = {
      'Accept': 'application/json',
      'content-type': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.post(
      Uri.parse("$baseUrl/api/v1/list/create"),
      headers: header,
      body: addConsumeListModelToJson(data),
    );

    var responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return [
        {
          "status": responseData['status'],
          "body": responseData['message'],
          "data": responseData['data']
        }
      ];
    } else if (response.statusCode == 422) {
      // Validation failed
      return [
        {
          "body": responseData['result'],
          "status": responseData['status'],
          "data": null
        }
      ];
    } else {
      return [
        {
          "message": responseData['message'],
          "body": responseData['status'],
          "data": null
        }
      ];
    }
  }
}
