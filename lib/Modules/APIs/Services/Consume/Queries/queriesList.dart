import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Models/Consume/Queries/queriesList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QueriesConsumeListService {
  final String baseUrl = "http://10.0.2.2:8000";
  Client client = Client();

  Future<List<QueriesConsumeListModel>> getAllConsumeList(
      String limit, String order) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/list/limit/$limit/order/$order"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return QueriesConsumeListModelFromJsonWPaginate(response.body);
    } else {
      return null;
    }
  }
}
