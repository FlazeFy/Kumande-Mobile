import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Models/Consume/Queries/queries.dart';

class QueriesConsumeService {
  final String baseUrl = "http://127.0.0.1:8000";
  Client client = Client();

  Future<List<QueriesConsumeModel>> getAllConsume() async {
    final response = await client.get(
        Uri.parse("$baseUrl/api/v1/consume/limit/10/order/DESC/favorite/0"));
    if (response.statusCode == 200) {
      return QueriesConsumeModelFromJsonWPaginate(response.body);
    } else {
      return null;
    }
  }
}
