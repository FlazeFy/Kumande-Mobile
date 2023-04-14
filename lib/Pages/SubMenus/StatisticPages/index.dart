import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/SubMenus/StatisticPages/Layouts/mostConsumeFrom.dart';
import 'package:kumande/Pages/SubMenus/StatisticPages/Layouts/mostConsumeType.dart';
import 'package:kumande/Pages/SubMenus/StatisticPages/Layouts/totalSpending.dart';

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
      body: ListView(
        padding: EdgeInsets.only(top: fullHeight * 0.06),
        children: const [
          MostConsumeTypeLayout(),
          MostConsumeFromLayout(),
          TotalSpendingLayout()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successBg,
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
