import 'package:flutter/material.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/APIs/Models/Analytic/queries.dart';
import 'package:kumande/Modules/APIs/Services/Analytic/queries.dart';
import 'package:kumande/Modules/Helpers/converter.dart';
import 'package:kumande/Modules/Variables/style.dart';

class ShowPaymentData extends StatefulWidget {
  const ShowPaymentData({Key key}) : super(key: key);

  @override
  State<ShowPaymentData> createState() => _ShowPaymentDataState();
}

class _ShowPaymentDataState extends State<ShowPaymentData> {
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
        future: apiService.getLifetimePayment(),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesSpendLifeModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesSpendLifeModel> contents = snapshot.data;
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesSpendLifeModel> contents) {
    // double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
          top: paddingContainerLG * 1,
          left: paddingContainerLG * 2,
          right: paddingContainerLG * 2),
      child: Row(children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: Image.asset('assets/icons/BudgetData.png',
              width: fullWidth * 0.2),
        ),
        const Spacer(),
        Container(
            width: fullWidth * 0.575,
            padding: EdgeInsets.all(paddingContentSM),
            decoration: BoxDecoration(
                border: Border.all(color: whiteBg, width: 1.5),
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getInputLabel("Spending Info", whiteBg, textMd),
                SizedBox(height: paddingContainerLG),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Total in Lifetime", whiteBg, textSm),
                        getInputLabel(convertPriceK(contents[0].total), whiteBg,
                            textLg + 5),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("in Days", whiteBg, textSm),
                        getInputLabel(
                            contents[0].days.toString(), whiteBg, textLg + 5),
                      ],
                    )
                  ],
                )
              ],
            ))
      ]),
    );
  }
}
