import 'package:flutter/material.dart';
import 'package:kumande/Components/Icons/icon.dart';
import 'package:kumande/Modules/Helpers/converter.dart';
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
        margin: const EdgeInsets.only(right: 10),
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

Widget getConsumeNameIcon(String type, String title) {
  return Container(
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.only(bottom: 5),
    child: RichText(
      maxLines: 2,
      overflow: TextOverflow.fade,
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              getTypeIcon(type),
              size: iconSMD,
              color: primaryBg,
            ),
          ),
          TextSpan(
              text: " $title",
              style: TextStyle(color: textPrimary, fontSize: textSm)),
        ],
      ),
    ),
  );
}

Widget getScheduleTextIcon(double width, String category) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ClipRRect(
        child: Image.asset('assets/icons/$category.png', width: width * 0.125),
      ),
      Text(category,
          style: TextStyle(
              color: primaryBg, fontSize: textMd, fontWeight: subTitleWeight))
    ],
  );
}

Widget getScheduleIcon(double width, String category) {
  return ClipRRect(
    child: Image.asset('assets/icons/$category.png', width: width),
  );
}

Widget getAnalyticContainer(String ctx, int num, var clr, String desc) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(ctx,
                style: TextStyle(
                    color: clr,
                    fontSize: textMd * 1.1,
                    fontWeight: subTitleWeight)),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(convertPriceK(num),
                    style: TextStyle(
                        color: clr,
                        fontSize: textLg,
                        fontWeight: subTitleWeight)),
                Text(desc,
                    style: TextStyle(color: textSecondary, fontSize: textSm)),
              ],
            )
          ],
        ),
      ],
    ),
  );
}
