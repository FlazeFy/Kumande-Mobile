import 'package:flutter/material.dart';
import 'package:kumande/Components/Containers/dashboard.dart';
import 'package:kumande/Components/Others/divider.dart';
import 'package:kumande/Modules/APIs/Models/Schedule/Queries/queries.dart';
import 'package:kumande/Modules/APIs/Services/Schedule/Queries/queries.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/style.dart';

class GetTodaySchedule extends StatefulWidget {
  GetTodaySchedule({Key key, this.type}) : super(key: key);
  String type;

  @override
  _GetTodaySchedule createState() => _GetTodaySchedule();
}

class _GetTodaySchedule extends State<GetTodaySchedule>
    with TickerProviderStateMixin {
  QueriesScheduleService apiService;

  @override
  void initState() {
    super.initState();
    apiService = QueriesScheduleService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      child: FutureBuilder(
        future: apiService.getTodaySchedule(getTodayDayString()),
        builder: (BuildContext context,
            AsyncSnapshot<List<QueriesTodayScheduleModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QueriesTodayScheduleModel> contents = snapshot.data;
            return _buildListView(contents);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildListView(List<QueriesTodayScheduleModel> contents) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Container(
      width: fullWidth,
      margin: const EdgeInsets.only(left: 10),
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
              Text("Today's ",
                  style: TextStyle(
                      color: whiteBg,
                      fontSize: textLg,
                      fontWeight: FontWeight.w500)),
              Text("Schedule",
                  style: TextStyle(color: whiteBg, fontSize: textMd)),
            ]),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Image.asset('assets/icons/Breakfast.png',
                          width: fullWidth * 0.125),
                    ),
                    Text("Breakfast",
                        style: TextStyle(
                            color: primaryBg,
                            fontSize: textMd,
                            fontWeight: subTitleWeight))
                  ],
                ),
                Column(
                    children: contents.map((val) {
                  if (val.scheduleTime[0]['category'] == "Breakfast") {
                    return getConsumeNameIcon(
                        val.consumeType, val.scheduleConsume);
                  } else {
                    return const SizedBox();
                  }
                }).toList())
              ],
            ),
          ),
          getDividerMini(primaryBg),
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Image.asset('assets/icons/Lunch.png',
                          width: fullWidth * 0.125),
                    ),
                    Text("Lunch",
                        style: TextStyle(
                            color: primaryBg,
                            fontSize: textMd,
                            fontWeight: subTitleWeight))
                  ],
                ),
                Column(
                    children: contents.map((val) {
                  if (val.scheduleTime[0]['category'] == "Lunch") {
                    return getConsumeNameIcon(
                        val.consumeType, val.scheduleConsume);
                  } else {
                    return const SizedBox();
                  }
                }).toList())
              ],
            ),
          ),
          getDividerMini(primaryBg),
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Image.asset('assets/icons/Dinner.png',
                          width: fullWidth * 0.125),
                    ),
                    Text("Dinner",
                        style: TextStyle(
                            color: primaryBg,
                            fontSize: textMd,
                            fontWeight: subTitleWeight))
                  ],
                ),
                Column(
                    children: contents.map((val) {
                  if (val.scheduleTime[0]['category'] == "Dinner") {
                    return getConsumeNameIcon(
                        val.consumeType, val.scheduleConsume);
                  } else {
                    return const SizedBox();
                  }
                }).toList())
              ],
            ),
          )
        ],
      ),
    );
  }
}
