import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Models/Consume/Queries/queries.dart';

class QueriesConsumeService {
  final String baseUrl = "http://127.0.0.1:8000";
  Client client = Client();

  Future<List<QueriesConsumeModel>> getAllConsume(
      String type, String order) async {
    final response = await client.get(Uri.parse(
        "$baseUrl/api/v1/consume/limit/10/order/$order/favorite/0/type/$type"));
    if (response.statusCode == 200) {
      return QueriesConsumeModelFromJsonWPaginate(response.body);
    } else {
      return null;
    }
  }

  Future<List<QueriesConsumeFromTotalModel>> getTotalConsumeByFrom() async {
    final response =
        await client.get(Uri.parse("$baseUrl/api/v1/consume/total/byfrom"));
    if (response.statusCode == 200) {
      return QueriesConsumeFromTotalModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
