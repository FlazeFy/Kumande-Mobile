import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MostConsumeFromLayout extends StatefulWidget {
  const MostConsumeFromLayout({Key key}) : super(key: key);

  @override
  State<MostConsumeFromLayout> createState() => _MostConsumeFromLayoutState();
}

class _MostConsumeFromLayoutState extends State<MostConsumeFromLayout> {
  List<PieData> data2 = [
    PieData('GoFood', 14),
    PieData('GrabFood', 18),
    PieData('Dine In', 10),
    PieData('Take Away', 10),
    PieData('ShopeeFood', 1),
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
            title: ChartTitle(text: 'Most Consume From'),
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
