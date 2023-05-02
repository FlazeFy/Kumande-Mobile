import 'package:flutter/material.dart';
import 'package:kumande/Components/Navbars/right/filter_consume.dart';
import 'package:kumande/Components/Navbars/tabbar.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
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

    return Scaffold(
      key: scaffoldKey,
      endDrawer: const FilterConsume(),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top: fullHeight * 0.06),
          children: [
            getTabBar(fullHeight, tabController, "Recent Consume", textPrimary,
                tabcolHistoryConsume)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successBg,
        onPressed: () {
          scaffoldKey.currentState.openEndDrawer();
        },
        tooltip: 'Filter',
        child: const Icon(Icons.settings),
      ),
    );
  }
}
