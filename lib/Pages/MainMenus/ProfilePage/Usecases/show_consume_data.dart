import 'package:flutter/material.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/APIs/Models/Consume/Queries/queries.dart';
import 'package:kumande/Modules/APIs/Services/Consume/Queries/queries.dart';
import 'package:kumande/Modules/Variables/style.dart';

class ShowConsumeData extends StatefulWidget {
  const ShowConsumeData({Key key}) : super(key: key);

  @override
  State<ShowConsumeData> createState() => _ShowConsumeDataState();
}

class _ShowConsumeDataState extends State<ShowConsumeData> {
  QueriesConsumeService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesConsumeService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getTotalConsumeByType(),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesConsumePieChartModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesConsumePieChartModel> contents = snapshot.data;
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesConsumePieChartModel> contents) {
    // double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;
    int food, drink, snack = 0;

    contents.forEach(
      (e) {
        if (e.ctx == "Food") {
          food = e.total;
        } else if (e.ctx == "Drink") {
          drink = e.total;
        } else if (e.ctx == "Snack") {
          snack = e.total;
        }
      },
    );

    return Container(
      margin: EdgeInsets.only(
          left: paddingContainerLG * 2, right: paddingContainerLG * 2),
      child: Row(children: [
        Container(
            padding: EdgeInsets.all(paddingContentSM),
            decoration: const BoxDecoration(
                color: Color(0xffebfe0f2),
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Image.asset('assets/icons/ConsumeData.png',
                  width: fullWidth * 0.17),
            )),
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
                getInputLabel("Consume Total", whiteBg, textMd),
                SizedBox(height: paddingContainerLG),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Food", whiteBg, textSm),
                        getInputLabel("$food", whiteBg, textMd),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Drink", whiteBg, textSm),
                        getInputLabel("$drink", whiteBg, textMd),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Snack", whiteBg, textSm),
                        getInputLabel("$snack", whiteBg, textMd),
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
