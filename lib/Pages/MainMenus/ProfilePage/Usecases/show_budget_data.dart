import 'package:flutter/material.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/Variables/style.dart';

class ShowBudgetData extends StatefulWidget {
  const ShowBudgetData({Key key}) : super(key: key);

  @override
  State<ShowBudgetData> createState() => _ShowBudgetDataState();
}

class _ShowBudgetDataState extends State<ShowBudgetData> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
          top: paddingContainerLG * 2,
          left: paddingContainerLG * 2,
          right: paddingContainerLG * 2),
      child: Row(children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: Image.asset('assets/icons/BudgetData.png',
              width: fullWidth * 0.2),
        ),
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
                getInputLabel("Spending Info", whiteBg, textMd),
                SizedBox(height: paddingContainerLG),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Total in Lifetime", whiteBg, textSm),
                        getInputLabel("2000K", whiteBg, textLg + 5),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("in Days", whiteBg, textSm),
                        getInputLabel("20", whiteBg, textLg + 5),
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
