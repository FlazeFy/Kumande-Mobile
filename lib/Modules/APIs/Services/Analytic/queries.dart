import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Models/Analytic/queries.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QueriesAnalyticService {
  final String baseUrl = "http://10.0.2.2:8000";
  Client client = Client();

  Future<List<QueriesMultiAnalyticModel>> getAnalyticPaymentMonth(
      int month, int year) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
    };

    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/analytic/payment/month/$month/year/$year"),
      headers: header,
    );
    if (response.statusCode == 200) {
      return QueriesMultiAnalyticModelFromJson(response.body);
    } else {
      return null;
    }
  }
}