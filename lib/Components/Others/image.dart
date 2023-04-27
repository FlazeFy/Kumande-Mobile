import 'package:flutter/material.dart';
import 'package:kumande/Modules/Variables/style.dart';

Widget getProfileImageSideBar(
    double width, double size, String url, String gender) {
  if (url != null && url != "null") {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: EdgeInsets.all(paddingContentSM),
      decoration: BoxDecoration(
        color: whiteBg,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Image.network(url, width: width * size),
      ),
    );
  } else {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: EdgeInsets.all(paddingContentSM),
      decoration: BoxDecoration(
        color: whiteBg,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Image.asset('assets/avatars/$gender.png', width: width * size),
      ),
    );
  }
}
