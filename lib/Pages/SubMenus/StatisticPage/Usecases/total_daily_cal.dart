import 'package:flutter/material.dart';
import 'package:kumande/Modules/APIs/Consume/Models/Queries/queries.dart';
import 'package:kumande/Modules/APIs/Consume/Services/Queries/queries.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TotalDailyCal extends StatefulWidget {
  const TotalDailyCal({Key key}) : super(key: key);

  @override
  State<TotalDailyCal> createState() => _TotalDailyCalState();
}

class _TotalDailyCalState extends State<TotalDailyCal> {
  List<LineData> chartData = [];
  QueriesConsumeService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesConsumeService();
  }

  @override
  Widget build(BuildContext context) {
    int year = DateTime.now().year;
    int month = DateTime.now().month;

    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getTotalDailyCal(month, year),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesConsumeLineChartModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesConsumeLineChartModel> contents = snapshot.data;

            contents.forEach((content) {
              String label = content.ctx;
              int total = content.total;
              LineData lineData = LineData(label, total.toDouble());
              chartData.add(lineData);
            });

            return _buildListView(chartData,
                getDateText(DateTime.now(), null, "month"), year.toString());
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  @override
  Widget _buildListView(List<LineData> contents, String month, String year) {
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
            title: ChartTitle(text: 'Total Daily Cal $month $year'),
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
