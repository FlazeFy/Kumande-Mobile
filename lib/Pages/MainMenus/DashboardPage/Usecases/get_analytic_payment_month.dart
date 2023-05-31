import 'package:flutter/material.dart';
import 'package:kumande/Components/Containers/dashboard.dart';
import 'package:kumande/Components/Others/divider.dart';
import 'package:kumande/Modules/APIs/Analytic/Models/queries.dart';
import 'package:kumande/Modules/APIs/Analytic/Services/queries.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/style.dart';

class GetAnalyticPaymentMonth extends StatefulWidget {
  GetAnalyticPaymentMonth({Key key, this.type}) : super(key: key);
  String type;

  @override
  _GetAnalyticPaymentMonth createState() => _GetAnalyticPaymentMonth();
}

class _GetAnalyticPaymentMonth extends State<GetAnalyticPaymentMonth>
    with TickerProviderStateMixin {
  QueriesAnalyticService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesAnalyticService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getAnalyticPaymentMonth(
            getDateNowInt("month"), getDateNowInt("year")),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesMultiAnalyticModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesMultiAnalyticModel> contents = snapshot.data;
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesMultiAnalyticModel> contents) {
    //double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Container(
      width: fullWidth,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: whiteBg,
          border: Border.all(color: primaryBg, width: 1.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              color: primaryBg,
            ),
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Payment's",
                  style: TextStyle(
                      color: whiteBg,
                      fontSize: textLg,
                      fontWeight: FontWeight.w500)),
              Text("Analytic (Monthly)",
                  style: TextStyle(color: whiteBg, fontSize: textMd)),
            ]),
          ),
          getAnalyticContainer(
              "Total", contents[0].total, warningBg, "this month"),
          getDividerMini(primaryBg),
          getAnalyticContainer(
              "Average", contents[0].average, successBg, "/day"),
          getDividerMini(primaryBg),
          getAnalyticContainer("Max", contents[0].max, dangerBg, "/day"),
          getDividerMini(primaryBg),
          getAnalyticContainer("Min", contents[0].min, primaryBg, "/day")
        ],
      ),
    );
  }
}
