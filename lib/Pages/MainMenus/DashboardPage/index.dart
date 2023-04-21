import 'package:flutter/material.dart';
import 'package:kumande/Components/Containers/dashboard.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/MainMenus/DashboardPage/Usecases/GetAnalyticPaymentMonth.dart';
import 'package:kumande/Pages/MainMenus/DashboardPage/Usecases/GetTodaySchedule.dart';
import 'package:kumande/Pages/SubMenus/AddConsumeListPages/index.dart';
import 'package:kumande/Pages/SubMenus/AddConsumePages/index.dart';
import 'package:kumande/Pages/SubMenus/ConsumeListPages/index.dart';
import 'package:kumande/Pages/SubMenus/StatisticPages/index.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: fullHeight * 0.06),
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: fullWidth * 0.44,
                  child: Column(children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        width: fullWidth * 0.44,
                        margin: const EdgeInsets.only(bottom: 10, left: 10),
                        decoration: BoxDecoration(
                          color: successBg,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddConsumePage()),
                            );
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 22,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Add Consume",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        )),
                    Container(
                        padding: const EdgeInsets.all(10),
                        width: fullWidth * 0.44,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: successBg,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddConsumeListPage()),
                            );
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 22,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Add List",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )),
                    GetTodaySchedule()
                  ]),
                ),
                const Spacer(),
                SizedBox(
                    width: fullWidth * 0.53,
                    child: Column(children: [
                      getDashboardContainer(
                          fullWidth,
                          14,
                          "Consume List",
                          "Collection.png",
                          containerBgThird,
                          warningBg,
                          context,
                          const ConsumeListPage()),
                      SizedBox(height: 10),
                      getDashboardContainer(
                          fullWidth,
                          3,
                          "Statistic",
                          "Statistics.png",
                          primaryBg,
                          containerBgSecondary,
                          context,
                          const StatisticPage()),
                      GetAnalyticPaymentMonth()
                    ]))
              ])
        ],
      ),
    );
  }
}
