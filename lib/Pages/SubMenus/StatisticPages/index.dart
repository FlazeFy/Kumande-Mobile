import 'package:flutter/material.dart';
import 'package:kumande/Components/Navbars/top.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/SubMenus/StatisticPages/Usecases/mostConsumeFrom.dart';
import 'package:kumande/Pages/SubMenus/StatisticPages/Usecases/mostConsumeType.dart';
import 'package:kumande/Pages/SubMenus/StatisticPages/Usecases/totalSpending.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({Key key}) : super(key: key);

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: getAppbar("Statistic"),
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: const [MostConsumeType(), MostConsumeFrom(), TotalSpending()],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successBg,
        onPressed: () {},
        tooltip: 'Generate Chart',
        child: const Icon(Icons.add),
      ),
    );
  }
}
