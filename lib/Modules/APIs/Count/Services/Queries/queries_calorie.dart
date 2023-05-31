import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Count/Models/Queries/queries_calorie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QueriesCountCalorieService {
  final String baseUrl = "http://10.0.2.2:8000";
  Client client = Client();

  Future<List<QueriesCountCalorieModel>> getMyBodyInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/count/calorie"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return queriesCountCalorieModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesFulfillCalorieModel>> getFulfillCalorie(
      String date) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/count/calorie/fulfill/$date"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return queriesFulfillCalorieModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
