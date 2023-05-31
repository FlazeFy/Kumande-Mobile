import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kumande/Components/Dialogs/failed.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Components/Navbars/top.dart';
import 'package:kumande/Modules/APIs/Consume/Models/Commands/commands.dart';
import 'package:kumande/Modules/APIs/Consume/Services/Commands/commands.dart';
import 'package:kumande/Modules/Firebases/Firestores/Consume/consume.dart';
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
  int consumePriceCtrl = 35000;

  ConsumeCommandsService apiService;
  ConsumeCommandsFirestore fireService;

  @override
  void initState() {
    super.initState();
    apiService = ConsumeCommandsService();
    fireService = ConsumeCommandsFirestore();
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
              consumeDetail: detail,
              consumeComment: consumeCommentCtrl.text,
              consumeFrom: slctConsumeFrom,
              consumeTag: selectedTagConsume,
              paymentMethod: slctConsumePaymentMethod,
              isFavorite: 0,
              isPayment: 1,
              paymentPrice: consumePriceCtrl.toInt()); // for now

          // Firebase
          try {
            var res = await fireService.addConsume(data);
            data.fireId = res;
            data.consumeDetail = jsonEncode(detail);
            data.consumeTag = jsonEncode(selectedTagConsume);

            // API
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
          } catch (error) {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => FailedDialog(text: error));
          }
        },
        tooltip: 'Save',
        child: const Icon(Icons.check),
      ),
    );
  }
}
