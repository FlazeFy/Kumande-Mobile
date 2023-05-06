import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Models/Consume/Queries/queries.dart';
import 'package:kumande/Modules/Helpers/converter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QueriesConsumeService {
  final String baseUrl = "http://10.0.2.2:8000";
  Client client = Client();

  Future<List<QueriesConsumeModel>> getAllConsume(int limit, String type,
      String order, String fav, int page, String provide) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse(
          "$baseUrl/api/v1/consume/limit/$limit/order/$order/favorite/${convertFavorite(fav)}/type/$type/provide/$provide?page=$page"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return queriesConsumeModelFromJsonWPaginate(response.body);
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
      return queriesConsumePieChartModelFromJson(response.body);
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
      return queriesConsumePieChartModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesConsumePieChartModel>> getTotalConsumeByMainIng() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/consume/total/bymain"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return queriesConsumePieChartModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesConsumePieChartModel>> getTotalConsumeByProvide() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/consume/total/byprovide"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return queriesConsumePieChartModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesConsumeLineChartModel>> getTotalDailyCal(
      int month, int year) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse(
          "$baseUrl/api/v1/consume/total/day/cal/month/$month/year/$year"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return queriesConsumeLineChartModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
