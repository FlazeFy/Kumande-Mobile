import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kumande/Components/Dialogs/failed.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Components/Navbars/top.dart';
import 'package:kumande/Modules/APIs/Models/Consume/Commands/commands.dart';
import 'package:kumande/Modules/APIs/Services/Consume/Commands/commands.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';
import 'package:kumande/Pages/SubMenus/AddConsumePage/Usecases/post_consume.dart';

class AddConsumePage extends StatefulWidget {
  const AddConsumePage({Key key}) : super(key: key);

  @override
  State<AddConsumePage> createState() => _AddConsumePageState();
}

class _AddConsumePageState extends State<AddConsumePage> {
  var consumeNameCtrl = TextEditingController();
  var consumeProvideCtrl = TextEditingController();
  var consumeMainIngCtrl = TextEditingController();
  var consumeCommentCtrl = TextEditingController();
  int consumeCalCtrl = 120;
  int consumePriceCtrl;
  ConsumeCommandsService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ConsumeCommandsService();
  }

  void _refreshPage() {
    setState(() {});
  }

  @override
  void dispose() {
    consumeNameCtrl.dispose();
    consumeProvideCtrl.dispose();
    consumeMainIngCtrl.dispose();
    consumeCommentCtrl.dispose();
    super.dispose();
  }

  void setConsumePrice(double val) {
    setState(() {
      consumePriceCtrl = val.toInt();
    });
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
      appBar: getAppbar("Add Consume"),
      body: ListView(
        padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
        children: [
          PostConsume(
            consumeNameCtrl: consumeNameCtrl,
            consumeProvideCtrl: consumeProvideCtrl,
            consumeMainIngCtrl: consumeMainIngCtrl,
            consumeCommentCtrl: consumeCommentCtrl,
            setConsumeCal: setConsumeCal,
            setConsumePrice: setConsumePrice,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successBg,
        onPressed: () async {
          var detail = [
            {
              "provide": consumeProvideCtrl.text,
              "calorie": consumeCalCtrl.toInt(),
              "main_ing": consumeMainIngCtrl.text
            }
          ];

          AddConsumeModel data = AddConsumeModel(
              consumeName: consumeNameCtrl.text,
              consumeType: slctConsumeType,
              consumeDetail: jsonEncode(detail),
              consumeComment: consumeCommentCtrl.text,
              consumeFrom: slctConsumeFrom,
              consumeTag: jsonEncode(selectedTagConsume),
              paymentMethod: slctConsumePaymentMethod,
              isFavorite: 0,
              isPayment: 1,
              paymentPrice: consumePriceCtrl.toInt()); // for now

          //Validator
          if (data.consumeName.isNotEmpty &&
              data.consumeType.isNotEmpty &&
              data.consumeFrom.isNotEmpty &&
              data.paymentMethod.isNotEmpty) {
            apiService.addConsume(data).then((response) {
              setState(() => _isLoading = false);
              var status = response[0]['status'];
              var body = response[0]['body'];

              if (status == "success") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomBar()),
                );
                setState(() {
                  page = 1;
                });
              } else {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>
                        FailedDialog(text: body));
                // print(status);

                consumeNameCtrl.clear();
                consumeProvideCtrl.clear();
                consumeMainIngCtrl.clear();
                consumeCommentCtrl.clear();
              }
            });
          } else {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => FailedDialog(
                    text: "Add consume, some field can't be empty"));
          }
        },
        tooltip: 'Save',
        child: const Icon(Icons.check),
      ),
    );
  }
}
