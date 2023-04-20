import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Models/Consume/Queries/queries.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QueriesConsumeService {
  final String baseUrl = "http://10.0.2.2:8000";
  Client client = Client();

  Future<List<QueriesConsumeModel>> getAllConsume(
      String type, String order) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse(
          "$baseUrl/api/v1/consume/limit/10/order/$order/favorite/0/type/$type"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return QueriesConsumeModelFromJsonWPaginate(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesConsumePieChartModel>> getTotalConsumeByFrom() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/consume/total/byfrom"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return QueriesConsumePieChartModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesConsumePieChartModel>> getTotalConsumeByType() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/consume/total/bytype"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return QueriesConsumePieChartModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
