import 'package:flutter/material.dart';
import 'package:kumande/Modules/APIs/Consume/Models/Queries/queries.dart';
import 'package:kumande/Modules/APIs/Consume/Services/Queries/queries.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MostMainIngredient extends StatefulWidget {
  const MostMainIngredient({Key key}) : super(key: key);

  @override
  State<MostMainIngredient> createState() => _MostMainIngredientState();
}

class _MostMainIngredientState extends State<MostMainIngredient> {
  List<PieData> chartData = [];
  QueriesConsumeService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesConsumeService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getTotalConsumeByMainIng(),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesConsumePieChartModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesConsumePieChartModel> contents = snapshot.data;

            contents.forEach((content) {
              String label = content.ctx;
              int total = content.total;
              PieData pieData = PieData(label, total);
              chartData.add(pieData);
            });

            return _buildListView(chartData);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<PieData> contents) {
    // double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return Container(
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: SfCircularChart(
            title: ChartTitle(text: 'Most Main Ingredient'),
            legend: Legend(isVisible: true),
            series: <PieSeries<PieData, String>>[
              PieSeries<PieData, String>(
                  explode: true,
                  explodeIndex: 0,
                  dataSource: chartData,
                  xValueMapper: (PieData data, _) => data.xData,
                  yValueMapper: (PieData data, _) => data.yData,
                  dataLabelMapper: (PieData data, _) => data.text,
                  dataLabelSettings: const DataLabelSettings(isVisible: true)),
            ]));
  }
}
