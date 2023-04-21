import 'package:flutter/material.dart';
import 'package:kumande/Components/Others/divider.dart';
import 'package:kumande/Modules/Variables/style.dart';

Widget getDashboardContainer(double width, int total, String title, String url,
    colorStart, colorEnd, ctx, route) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        ctx,
        MaterialPageRoute(builder: (context) => route),
      );
    },
    child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 10, right: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colorStart, colorEnd],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            ClipRRect(
              child: Image.asset('assets/icons/$url', width: width * 0.15),
            ),
            const Spacer(),
            SizedBox(
                width: width * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Text(title,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                color: Color(0xFF212121),
                                fontSize: 14,
                                fontWeight: FontWeight.w500))),
                    Container(
                      alignment: Alignment.centerRight,
                      width: width * 0.45,
                      child: Text(total.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Color(0xFF212121),
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                )),
          ],
        )),
  );
}

Widget getScheduleContainer(double height, double width) {
  return Container(
    width: width,
    margin: const EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: whiteBg,
        border: Border.all(color: primaryBg, width: 1.5)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            color: primaryBg,
          ),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Today's ",
                style: TextStyle(
                    color: whiteBg,
                    fontSize: textLg,
                    fontWeight: FontWeight.w500)),
            Text("Schedule",
                style: TextStyle(color: whiteBg, fontSize: textMd)),
          ]),
        ),
        Container(
          padding: EdgeInsets.only(left: 5),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Image.asset('assets/icons/Breakfast.png',
                        width: width * 0.125),
                  ),
                  Text("Breakfast",
                      style: TextStyle(
                          color: primaryBg,
                          fontSize: textMd,
                          fontWeight: subTitleWeight))
                ],
              )
            ],
          ),
        ),
        getDividerMini(primaryBg),
        Container(
          padding: EdgeInsets.only(left: 5),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Image.asset('assets/icons/Lunch.png',
                        width: width * 0.125),
                  ),
                  Text("Lunch",
                      style: TextStyle(
                          color: primaryBg,
                          fontSize: textMd,
                          fontWeight: subTitleWeight))
                ],
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(bottom: 5),
                child: RichText(
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.rice_bowl,
                          size: iconSMD,
                          color: primaryBg,
                        ),
                      ),
                      TextSpan(
                          text: " Ayam Geprek Sambal Matah",
                          style:
                              TextStyle(color: textPrimary, fontSize: textSm)),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(bottom: 5),
                child: RichText(
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.rice_bowl,
                          size: iconSMD,
                          color: primaryBg,
                        ),
                      ),
                      TextSpan(
                          text: " Ayam Geprek Sambal Matah",
                          style:
                              TextStyle(color: textPrimary, fontSize: textSm)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        getDividerMini(primaryBg),
        Container(
          padding: EdgeInsets.only(left: 5),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Image.asset('assets/icons/Dinner.png',
                        width: width * 0.125),
                  ),
                  Text("Dinner",
                      style: TextStyle(
                          color: primaryBg,
                          fontSize: textMd,
                          fontWeight: subTitleWeight))
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
