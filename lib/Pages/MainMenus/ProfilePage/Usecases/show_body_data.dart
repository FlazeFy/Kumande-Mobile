import 'package:flutter/material.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/APIs/Models/Count/Queries/queries_calorie.dart';
import 'package:kumande/Modules/APIs/Services/Count/Queries/queries_calorie.dart';
import 'package:kumande/Modules/Variables/style.dart';

class ShowHealthData extends StatefulWidget {
  const ShowHealthData({Key key}) : super(key: key);

  @override
  State<ShowHealthData> createState() => _ShowHealthDataState();
}

class _ShowHealthDataState extends State<ShowHealthData> {
  QueriesCountCalorieService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesCountCalorieService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getMyBodyInfo(),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesCountCalorieModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesCountCalorieModel> contents = snapshot.data;
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesCountCalorieModel> contents) {
    // double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

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
              child: Image.asset('assets/icons/BodyData.png',
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
                getInputLabel("Body Info", whiteBg, textMd),
                SizedBox(height: paddingContainerLG),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Weight", whiteBg, textSm),
                        getInputLabel(
                            "${contents[0].weight} Kg", whiteBg, textMd - 1),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Height", whiteBg, textSm),
                        getInputLabel(
                            "${contents[0].height} Cm", whiteBg, textMd - 1),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Calories / day", whiteBg, textSm),
                        getInputLabel(
                            "${contents[0].result} Cal", whiteBg, textMd - 1),
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
