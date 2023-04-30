import 'package:flutter/material.dart';
import 'package:kumande/Modules/APIs/Models/Schedule/Queries/queries.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';

class GetMySchedule extends StatefulWidget {
  GetMySchedule({Key key, this.schedule}) : super(key: key);
  List<QueriesMyScheduleModel> schedule;

  @override
  State<GetMySchedule> createState() => _GetMyScheduleState();
}

class _GetMyScheduleState extends State<GetMySchedule> {
  int i = 0;

  @override
  void initState() {
    clearTable();
    super.initState();
    buildTable();
  }

  clearTable() {
    tableCellSchedule.removeRange(1, tableCellSchedule.length);
  }

  buildTable() {
    for (int j = 0; j < 7; j++) {
      String dayCheck = getTodayDayString(j);
      var breakfast = const Text("");
      var lunch = const Text("");
      var dinner = const Text("");

      if (widget.schedule != null) {
        widget.schedule.forEach((e) {
          if (e.day == dayCheck) {
            if (e.time == "Breakfast") {
              breakfast = Text(e.scheduleConsume,
                  style: TextStyle(
                      color: textPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: textSm - 1.5));
              return;
            } else if (e.time == "Lunch") {
              lunch = Text(e.scheduleConsume,
                  style: TextStyle(
                      color: textPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: textSm - 1.5));
              return;
            } else if (e.time == "Dinner") {
              dinner = Text(e.scheduleConsume,
                  style: TextStyle(
                      color: textPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: textSm - 1.5));
              return;
            }
          }
        });
      } else {
        breakfast = Text("",
            style: TextStyle(
                color: textPrimary,
                fontWeight: FontWeight.w500,
                fontSize: textSm - 1.5));
      }

      tableCellSchedule.add({
        "title": TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: paddingContentSM),
            child: Text(dayCheck,
                style:
                    TextStyle(color: textPrimary, fontWeight: FontWeight.w500)),
          ),
        ),
        "breakfast": TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(paddingContentSM),
                child: breakfast)),
        "lunch": TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(paddingContentSM),
              child: lunch,
            )),
        "dinner": TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(paddingContentSM),
              child: dinner),
        ),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;

    return Padding(
        padding: EdgeInsets.all(paddingContainerLG),
        child: Table(
            border: TableBorder.all(
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(60),
              1: FlexColumnWidth(),
              2: FlexColumnWidth(),
              3: FlexColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: tableCellSchedule.map<TableRow>((e) {
              i++;
              if (i == 1) {
                return TableRow(
                  decoration: BoxDecoration(
                      color: primaryBg,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10))),
                  children: <Widget>[
                    tableCellSchedule[0]["title"],
                    tableCellSchedule[0]["breakfast"],
                    tableCellSchedule[0]["lunch"],
                    tableCellSchedule[0]["dinner"]
                  ],
                );
              } else if (i == 2) {
                return TableRow(
                  decoration: BoxDecoration(color: successBg.withOpacity(0.5)),
                  children: <Widget>[
                    tableCellSchedule[i - 1]["title"],
                    tableCellSchedule[i - 1]["breakfast"],
                    tableCellSchedule[i - 1]["lunch"],
                    tableCellSchedule[i - 1]["dinner"]
                  ],
                );
              } else {
                return TableRow(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  children: <Widget>[
                    tableCellSchedule[i - 1]["title"],
                    tableCellSchedule[i - 1]["breakfast"],
                    tableCellSchedule[i - 1]["lunch"],
                    tableCellSchedule[i - 1]["dinner"]
                  ],
                );
              }
            }).toList()));
  }
}
