import 'package:http/http.dart' show Client;
import 'package:kumande/Modules/APIs/Models/Payment/Queries/queries.dart';

class QueriesPaymentService {
  final String baseUrl = "http://127.0.0.1:8000";
  Client client = Client();

  Future<List<QueriesPaymentLineChartModel>> getTotalSpendMonth(
      int year) async {
    final response = await client
        .get(Uri.parse("$baseUrl/api/v1/payment/total/month/$year"));
    if (response.statusCode == 200) {
      return QueriesPaymentLineChartModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
