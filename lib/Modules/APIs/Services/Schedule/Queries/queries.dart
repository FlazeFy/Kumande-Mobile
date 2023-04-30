import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Models/Schedule/Queries/queries.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QueriesScheduleService {
  final String baseUrl = "http://10.0.2.2:8000";
  Client client = Client();

  Future<List<QueriesTodayScheduleModel>> getTodaySchedule(String day) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/schedule/day/$day"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return queriesTodayScheduleModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesMyScheduleModel>> getMySchedule() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/schedule"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return queriesMyScheduleModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
