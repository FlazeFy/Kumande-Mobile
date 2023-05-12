import 'package:flutter/material.dart';
import 'package:kumande/Modules/APIs/Models/Budget/Queries/queries.dart';
import 'package:kumande/Modules/APIs/Services/Budget/Queries/queries.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TotalBudget extends StatefulWidget {
  const TotalBudget({Key key}) : super(key: key);

  @override
  State<TotalBudget> createState() => _TotalBudgetState();
}

class _TotalBudgetState extends State<TotalBudget> {
  List<LineData> chartData = [];
  QueriesBudgetService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesBudgetService();
  }

  @override
  Widget build(BuildContext context) {
    int year = DateTime.now().year;

    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getAllBudget(year),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesBudgetLineChartModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesBudgetLineChartModel> contents = snapshot.data;

            contents.forEach((content) {
              String label = content.ctx;
              int total = content.total;
              LineData lineData = LineData(label, total.toDouble());
              chartData.add(lineData);
            });

            return _buildListView(chartData, year.toString());
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  @override
  Widget _buildListView(List<LineData> contents, String year) {
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
            title: ChartTitle(text: 'All Budget in $year'),
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
