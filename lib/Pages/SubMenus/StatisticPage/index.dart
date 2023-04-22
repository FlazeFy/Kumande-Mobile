import 'package:flutter/material.dart';
import 'package:kumande/Components/Navbars/top.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/SubMenus/StatisticPage/Usecases/mostConsumeFrom.dart';
import 'package:kumande/Pages/SubMenus/StatisticPage/Usecases/mostConsumeType.dart';
import 'package:kumande/Pages/SubMenus/StatisticPage/Usecases/mostMainIng.dart';
import 'package:kumande/Pages/SubMenus/StatisticPage/Usecases/totalDailyCal.dart';
import 'package:kumande/Pages/SubMenus/StatisticPage/Usecases/totalSpending.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({Key key}) : super(key: key);

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  @override
  Widget build(BuildContext context) {
    // double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: getAppbar("Statistic"),
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: const [
          MostConsumeType(),
          MostConsumeFrom(),
          MostMainIngredient(),
          TotalSpending(),
          TotalDailyCal()
        ],
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
