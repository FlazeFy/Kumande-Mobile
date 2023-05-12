import 'package:flutter/material.dart';
import 'package:kumande/Components/Navbars/tabbar.dart';
import 'package:kumande/Components/Navbars/top.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/SubMenus/StatisticPage/Usecases/most_consume_from.dart';
import 'package:kumande/Pages/SubMenus/StatisticPage/Usecases/most_consume_provide.dart';
import 'package:kumande/Pages/SubMenus/StatisticPage/Usecases/most_consume_type.dart';
import 'package:kumande/Pages/SubMenus/StatisticPage/Usecases/most_main_ing.dart';
import 'package:kumande/Pages/SubMenus/StatisticPage/Usecases/total_budget_year.dart';
import 'package:kumande/Pages/SubMenus/StatisticPage/Usecases/total_daily_cal.dart';
import 'package:kumande/Pages/SubMenus/StatisticPage/Usecases/total_spending.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({Key key}) : super(key: key);

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage>
    with TickerProviderStateMixin {
  TabController tabController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: getAppbar("Statistic"),
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: [
          getTabBar(fullHeight, tabController, "Category", textPrimary,
              tabcolStatistic)
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

class StatisticTabs extends StatefulWidget {
  StatisticTabs({Key key, this.type}) : super(key: key);
  String type;

  @override
  State<StatisticTabs> createState() => _StatisticTabsState();
}

class _StatisticTabsState extends State<StatisticTabs> {
  @override
  Widget build(BuildContext context) {
    if (widget.type == "consume") {
      return ListView(
        padding: const EdgeInsets.only(top: 10),
        children: const [
          MostConsumeType(),
          MostConsumeFrom(),
          MostConsumeProvide(),
          MostMainIngredient()
        ],
      );
    } else if (widget.type == "spending") {
      return ListView(
        padding: const EdgeInsets.only(top: 10),
        children: const [TotalSpending()],
      );
    } else if (widget.type == "health") {
      return ListView(
        padding: const EdgeInsets.only(top: 10),
        children: const [TotalDailyCal()],
      );
    } else if (widget.type == "budget") {
      return ListView(
        padding: const EdgeInsets.only(top: 10),
        children: const [TotalBudget()],
      );
    }
  }
}
