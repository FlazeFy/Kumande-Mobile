import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MostConsumeType extends StatefulWidget {
  const MostConsumeType({Key key}) : super(key: key);

  @override
  State<MostConsumeType> createState() => _MostConsumeTypeState();
}

class _MostConsumeTypeState extends State<MostConsumeType> {
  List<PieData> data2 = [
    PieData('Food', 16),
    PieData('Drink', 8),
    PieData('Snack', 6),
  ];

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Container(
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: SfCircularChart(
            title: ChartTitle(text: 'Most Consume Type'),
            legend: Legend(isVisible: true),
            series: <PieSeries<PieData, String>>[
              PieSeries<PieData, String>(
                  explode: true,
                  explodeIndex: 0,
                  dataSource: data2,
                  xValueMapper: (PieData data, _) => data.xData,
                  yValueMapper: (PieData data, _) => data.yData,
                  dataLabelMapper: (PieData data, _) => data.text,
                  dataLabelSettings: const DataLabelSettings(isVisible: true)),
            ]));
  }
}
