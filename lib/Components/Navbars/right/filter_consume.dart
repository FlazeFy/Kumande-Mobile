import 'package:flutter/material.dart';
import 'package:kumande/Components/Forms/input.dart';
import 'package:kumande/Components/Navbars/bottom.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/Variables/global.dart';
import 'package:kumande/Modules/Variables/style.dart';

class FilterConsume extends StatefulWidget {
  const FilterConsume({Key key}) : super(key: key);

  @override
  State<FilterConsume> createState() => _FilterConsumeState();
}

class _FilterConsumeState extends State<FilterConsume> {
  @override
  Widget build(BuildContext context) {
    //double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Drawer(
        child: Container(
            padding: EdgeInsets.only(
                top: fullWidth * 0.15,
                left: paddingContainerLG,
                right: paddingContainerLG),
            decoration: BoxDecoration(color: whiteBg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: paddingContainerLG),
                    child: Text("Control Panel",
                        style: TextStyle(
                            color: primaryBg,
                            fontSize: textMd,
                            fontWeight: FontWeight.w500))),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Order By", textPrimary, textSm),
                        getDropDownMain(
                            slctConsumeFilterOrder, optionsConsumeFilterOrder,
                            (String newValue) {
                          setState(() {
                            slctConsumeFilterOrder = newValue;
                          });
                        }),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Limit per Page", textPrimary, textSm),
                        getDropDownMain(
                            slctConsumeFilterLimit, optionsConsumeFilterLimit,
                            (String newValue) {
                          setState(() {
                            slctConsumeFilterLimit = newValue;
                          });
                        }),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Favorite", textPrimary, textSm),
                        getDropDownMain(slctConsumeFav, optionsConsumeFav,
                            (String newValue) {
                          setState(() {
                            slctConsumeFav = newValue;
                          });
                        }),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: paddingContainerLG,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                    backgroundColor: MaterialStatePropertyAll<Color>(successBg),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomBar()),
                    );
                    setState(() {
                      page = 1;
                    });
                  },
                  child: Text("Apply Changes",
                      style: TextStyle(fontSize: textSm, color: whiteBg)),
                )
              ],
            )));
  }
}
