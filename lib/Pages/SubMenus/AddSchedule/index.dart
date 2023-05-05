import 'package:flutter/material.dart';
import 'package:kumande/Components/Navbars/top.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/SubMenus/AddSchedule/Usecases/post_schedule.dart';

class AddSchedulePage extends StatefulWidget {
  const AddSchedulePage({Key key}) : super(key: key);

  @override
  State<AddSchedulePage> createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  var scheduleConsume = TextEditingController();
  var scheduleDesc = TextEditingController();
  var consumeMainIng = TextEditingController();
  var consumeProvider = TextEditingController();
  int consumeCalCtrl;
  DateTime scheduleTime;

  void _refreshPage() {
    setState(() {});
  }

  @override
  void dispose() {
    scheduleDesc.dispose();
    scheduleConsume.dispose();
    consumeMainIng.dispose();
    consumeProvider.dispose();
    super.dispose();
  }

  void setConsumeCal(double val) {
    setState(() {
      consumeCalCtrl = val.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    // double fullHeight = MediaQuery.of(context).size.height;
    // double fullWidth = MediaQuery.of(context).size.width;
    bool _isLoading = false;

    return Scaffold(
      appBar: getAppbar("Add Schedule"),
      body: ListView(
        padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
        children: [
          PostSchedule(
            scheduleConsume: scheduleConsume,
            scheduleDesc: scheduleDesc,
            setConsumeCal: setConsumeCal,
            consumeProvider: consumeProvider,
            consumeMainIng: consumeMainIng,
            scheduleTime: scheduleTime,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successBg,
        onPressed: () async {},
        tooltip: 'Save',
        child: const Icon(Icons.check),
      ),
    );
  }
}
