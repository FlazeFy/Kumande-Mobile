import 'package:flutter/material.dart';
import 'package:kumande/Components/Typography/text.dart';
import 'package:kumande/Modules/Variables/style.dart';

class ShowHealthData extends StatefulWidget {
  const ShowHealthData({Key key}) : super(key: key);

  @override
  State<ShowHealthData> createState() => _ShowHealthDataState();
}

class _ShowHealthDataState extends State<ShowHealthData> {
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
              child: Image.asset('assets/icons/BodyData.png',
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
                getInputLabel("Body Info", whiteBg, textMd),
                SizedBox(height: paddingContainerLG),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Weight", whiteBg, textSm),
                        getInputLabel("60 Kg", whiteBg, textMd - 1),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Height", whiteBg, textSm),
                        getInputLabel("183 Cm", whiteBg, textMd - 1),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getInputLabel("Calories / day", whiteBg, textSm),
                        getInputLabel("1800 Cal", whiteBg, textMd - 1),
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
