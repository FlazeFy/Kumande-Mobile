import 'package:flutter/material.dart';
import 'package:kumande/Components/Containers/dashboard.dart';
import 'package:kumande/Modules/Variables/style.dart';

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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            size: 22,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Add Consume",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )),
                    Container(
                        padding: const EdgeInsets.all(10),
                        width: fullWidth * 0.44,
                        margin: const EdgeInsets.only(bottom: 10, left: 10),
                        decoration: BoxDecoration(
                          color: successBg,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: TextButton.icon(
                          onPressed: () {},
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
                  ]),
                ),
                const Spacer(),
                SizedBox(
                    width: fullWidth * 0.53,
                    child: Column(children: [
                      getDashboardContainer(fullWidth, 14, "Consume List",
                          "Collection.png", containerBgThird, warningBg),
                      getDashboardContainer(fullWidth, 3, "Statistics",
                          "Statistics.png", primaryBg, containerBgSecondary)
                    ]))
              ])
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
