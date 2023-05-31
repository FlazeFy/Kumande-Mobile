import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Budget/Models/Queries/queries.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QueriesBudgetService {
  final String baseUrl = "http://10.0.2.2:8000";
  Client client = Client();

  Future<List<QueriesBudgetLineChartModel>> getAllBudget(int year) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/budget/$year"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return queriesBudgetLineChartModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
