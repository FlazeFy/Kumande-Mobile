import 'package:flutter/material.dart';
import 'package:kumande/Components/Forms/input.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Components/Navbars/tabbar.dart';
import 'package:kumande/Components/Typography/text.dart';
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

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
        onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('Filter Consume'),
                  content: SizedBox(
                    height: 200,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getInputLabel("Order By", textPrimary, textSm),
                          getDropDownMain(
                              slctConsumeFilterOrder, optionsConsumeFilterOrder,
                              (String newValue) {
                            setState(() {
                              slctConsumeFilterOrder = newValue;
                            });
                          }),
                        ]),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        )),
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(successBg),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomBar()),
                        );
                        setState(() {
                          page = 1;
                        });
                      },
                      child: Text("Apply Changes",
                          style: TextStyle(fontSize: textSm, color: whiteBg)),
                    )
                  ],
                )),
        tooltip: 'Filter',
        child: const Icon(Icons.settings),
      ),
    );
  }
}
