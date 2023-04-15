import 'package:flutter/material.dart';
import 'package:kumande/Components/Forms/input.dart';
import 'package:kumande/Components/Navbars/top.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';

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
  double consumeCalCtrl;
  double consumePriceCtrl;

  void _refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: getAppbar("Add Consume"),
      body: ListView(
        padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
        children: [
          getInputLabel("Consume", primaryBg, textLg),
          const SizedBox(height: 10),
          getInputLabel("Name", textPrimary, textSm),
          getInputTextMain(consumeNameCtrl, "ex : Rendang", 50),
          getInputLabel("Provide", textPrimary, textSm),
          getInputTextMain(consumeProvideCtrl, "ex : Warung Budi", 50),
          getInputLabel("Main Ingredient", textPrimary, textSm),
          getInputTextMain(consumeMainIngCtrl, "ex : Meat", 50),
          Row(
            children: [
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    getInputLabel("From", textPrimary, textSm),
                    getDropDownMain(slctConsumeFrom, optionsConsumeFrom,
                        (String newValue) {
                      setState(() {
                        slctConsumeFrom = newValue;
                      });
                    }),
                  ])),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getInputLabel("Type", textPrimary, textSm),
                      getDropDownMain(slctConsumeType, optionsConsumeType,
                          (String newValue) {
                        setState(() {
                          slctConsumeType = newValue;
                        });
                      })
                    ]),
              ),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    getInputLabel("Calorie", textPrimary, textSm),
                    getInputNumberMain(
                        consumeCalCtrl, "Cal", 10.0, 600.0, 120.0)
                  ]))
            ],
          ),
          const SizedBox(height: 10),
          Divider(
            height: paddingDivider,
            thickness: 1,
          ),
          getInputLabel("Prices", primaryBg, textLg),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getInputLabel("Method", textPrimary, textSm),
                      getDropDownMain(
                          slctConsumePaymentMethod, optionsConsumePaymentMethod,
                          (String newValue) {
                        setState(() {
                          slctConsumeType = newValue;
                        });
                      })
                    ]),
              ),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    getInputLabel("Price", textPrimary, textSm),
                    getInputNumberMain(
                        consumePriceCtrl, "Rp.", 1000.0, 1000000.0, 35000.0)
                  ]))
            ],
          ),
          const SizedBox(height: 10),
          Divider(
            height: paddingDivider,
            thickness: 1,
          ),
          getInputLabel("Comment", primaryBg, textLg),
          const SizedBox(height: 10),
          getInputDescMain(
              consumeMainIngCtrl, "ex : The taste is good", 255, 5, 5),
          const SizedBox(height: 10),
          Divider(
            height: paddingDivider,
            thickness: 1,
          ),
          getInputLabel("My Tag", primaryBg, textLg),
          generateTag(tagListDummy, _refreshPage, "tag_consume"),
          generateSelectedTag(selectedTagConsume, _refreshPage, "tag_consume")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successBg,
        onPressed: () {},
        tooltip: 'Save',
        child: const Icon(Icons.check),
      ),
    );
  }
}
