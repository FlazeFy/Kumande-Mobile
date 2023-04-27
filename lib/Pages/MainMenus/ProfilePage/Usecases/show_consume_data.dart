import 'package:flutter/material.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/Variables/style.dart';

class ShowConsumeData extends StatefulWidget {
  const ShowConsumeData({Key key}) : super(key: key);

  @override
  State<ShowConsumeData> createState() => _ShowConsumeDataState();
}

class _ShowConsumeDataState extends State<ShowConsumeData> {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
          top: paddingContainerLG,
          left: paddingContainerLG * 2,
          right: paddingContainerLG * 2),
      child: Row(children: [
        Container(
            padding: EdgeInsets.all(paddingContentSM),
            decoration: const BoxDecoration(
                color: Color(0xffebfe0f2),
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Image.asset('assets/icons/ConsumeData.png',
                  width: fullWidth * 0.17),
            )),
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
                getInputLabel("Consume Total", whiteBg, textMd),
                SizedBox(height: paddingContainerLG),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Food", whiteBg, textSm),
                        getInputLabel("20", whiteBg, textMd),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Drink", whiteBg, textSm),
                        getInputLabel("13", whiteBg, textMd),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Snack", whiteBg, textSm),
                        getInputLabel("11", whiteBg, textMd),
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
