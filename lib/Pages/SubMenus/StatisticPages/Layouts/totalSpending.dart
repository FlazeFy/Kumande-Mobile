import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TotalSpendingLayout extends StatefulWidget {
  const TotalSpendingLayout({Key key}) : super(key: key);

  @override
  State<TotalSpendingLayout> createState() => _TotalSpendingLayoutState();
}

class _TotalSpendingLayoutState extends State<TotalSpendingLayout> {
  List<LineData> data = [
    LineData('Jan', 35),
    LineData('Feb', 28),
    LineData('Mar', 34),
    LineData('Apr', 32),
    LineData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Container(
        margin: const EdgeInsets.all(10),
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: 'Total Spending 2023'),
            legend: Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<LineData, String>>[
              LineSeries<LineData, String>(
                  dataSource: data,
                  xValueMapper: (LineData dt, _) => dt.month,
                  yValueMapper: (LineData dt, _) => dt.total,
                  name: 'Total',
                  dataLabelSettings: const DataLabelSettings(isVisible: true))
            ]),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ));
  }
}
