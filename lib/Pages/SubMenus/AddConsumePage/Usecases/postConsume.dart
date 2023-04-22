import 'package:flutter/material.dart';
import 'package:kumande/Components/Forms/input.dart';
import 'package:kumande/Components/Navbars/top.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/Helpers/generator.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';

class PostConsume extends StatefulWidget {
  PostConsume(
      {Key key,
      this.consumeNameCtrl,
      this.consumeProvideCtrl,
      this.consumeMainIngCtrl,
      this.consumeCommentCtrl,
      this.setConsumeCal,
      this.setConsumePrice})
      : super(key: key);
  TextEditingController consumeNameCtrl;
  TextEditingController consumeProvideCtrl;
  TextEditingController consumeMainIngCtrl;
  TextEditingController consumeCommentCtrl;

  final Function(double) setConsumeCal;
  final Function(double) setConsumePrice;

  @override
  State<PostConsume> createState() => _PostConsumeState();
}

class _PostConsumeState extends State<PostConsume> {
  void _refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        getInputLabel("Consume", primaryBg, textLg),
        const SizedBox(height: 10),
        getInputLabel("Name", textPrimary, textSm),
        getInputTextMain(widget.consumeNameCtrl, "ex : Rendang", 50),
        getInputLabel("Provide", textPrimary, textSm),
        getInputTextMain(widget.consumeProvideCtrl, "ex : Warung Budi", 50),
        getInputLabel("Main Ingredient", textPrimary, textSm),
        getInputTextMain(widget.consumeMainIngCtrl, "ex : Meat", 50),
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
                  // getInputNumberMain(
                  //     widget.consumeCalCtrl., "Cal", 10.0, 600.0, 120.0)
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
                        slctConsumePaymentMethod = newValue;
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
                      widget.setConsumePrice, "Rp.", 1000.0, 1000000.0, 35000.0)
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
            widget.consumeCommentCtrl, "ex : The taste is good", 255, 5, 5),
        const SizedBox(height: 10),
        Divider(
          height: paddingDivider,
          thickness: 1,
        ),
        getInputLabel("My Tag", primaryBg, textLg),
        generateTag(tagListDummy, _refreshPage, "tag_consume"),
        generateSelectedTag(selectedTagConsume, _refreshPage, "tag_consume")
      ],
    );
  }
}
