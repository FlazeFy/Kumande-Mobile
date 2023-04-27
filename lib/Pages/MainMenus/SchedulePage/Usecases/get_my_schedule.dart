import 'package:flutter/material.dart';
import 'package:kumande/Components/Containers/dashboard.dart';
import 'package:kumande/Modules/APIs/Services/Payment/Queries/queries.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';

class GetMySchedule extends StatefulWidget {
  const GetMySchedule({Key key}) : super(key: key);

  @override
  State<GetMySchedule> createState() => _GetMyScheduleState();
}

class _GetMyScheduleState extends State<GetMySchedule> {
  DateTime selectedDay = slctSchedule;
  DateTime focusedDay = slctSchedule;
  QueriesPaymentService apiService;
  int i = 0;

  @override
  void initState() {
    clearTable();
    super.initState();
    buildTable();
    apiService = QueriesPaymentService();
  }

  clearTable() {
    tableCellSchedule.removeRange(1, tableCellSchedule.length);
  }

  buildTable() {
    for (int j = 0; j < 7; j++) {
      tableCellSchedule.add({
        "title": TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: paddingContentSM),
            child: Text(getTodayDayString(j),
                style:
                    TextStyle(color: textPrimary, fontWeight: FontWeight.w500)),
          ),
        ),
        "breakfast": TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(),
        ),
        "lunch": TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(),
        ),
        "dinner": TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(),
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
