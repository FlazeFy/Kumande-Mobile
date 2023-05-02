import 'package:flutter/material.dart';
import 'package:kumande/Modules/APIs/Models/Consume/Queries/queries_payment.dart';
import 'package:kumande/Modules/APIs/Services/Consume/Queries/queries_payment.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TotalSpending extends StatefulWidget {
  const TotalSpending({Key key}) : super(key: key);

  @override
  State<TotalSpending> createState() => _TotalSpendingState();
}

class _TotalSpendingState extends State<TotalSpending> {
  List<LineData> chartData = [];
  QueriesPaymentService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesPaymentService();
  }

  @override
  Widget build(BuildContext context) {
    int year = DateTime.now().year;

    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getTotalSpendMonth(year),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesPaymentLineChartModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesPaymentLineChartModel> contents = snapshot.data;

            contents.forEach((content) {
              String label = content.ctx;
              int total = content.total;
              LineData lineData = LineData(label, total.toDouble());
              chartData.add(lineData);
            });

            return _buildListView(chartData);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  @override
  Widget _buildListView(List<LineData> contents) {
    // double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return Container(
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: 'Total Spending 2023'),
            legend: Legend(isVisible: false),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<LineData, String>>[
              LineSeries<LineData, String>(
                  dataSource: chartData,
                  xValueMapper: (LineData dt, _) => dt.month,
                  yValueMapper: (LineData dt, _) => dt.total,
                  name: 'Total',
                  dataLabelSettings: const DataLabelSettings(isVisible: true))
            ]));
  }
}
