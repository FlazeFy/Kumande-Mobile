import 'package:get/get.dart';
import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Count/Models/Queries/queries_calorie.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/Landings/LoginPage/index.dart';
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
    } else if (response.statusCode == 401) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      Get.offAll(() => const LoginPage());
      Get.snackbar("Alert", "Session lost, please sign in again".tr,
          backgroundColor: whiteBg);
      return null;
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
    } else if (response.statusCode == 401) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      Get.offAll(() => const LoginPage());
      Get.snackbar("Alert", "Session lost, please sign in again".tr,
          backgroundColor: whiteBg);
      return null;
    } else {
      return null;
    }
  }
}
