import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Models/Consume/Queries/queries_payment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QueriesPaymentService {
  final String baseUrl = "http://10.0.2.2:8000";
  Client client = Client();

  Future<List<QueriesPaymentLineChartModel>> getTotalSpendMonth(
      int year) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/payment/total/month/$year"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return queriesPaymentLineChartModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesPaymentLineChartModel>> getTotalSpendDay(
      int month, int year) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/payment/total/month/$month/year/$year"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return queriesPaymentLineChartModelFromJson(response.body);
    } else {
      return null;
    }
  }
}