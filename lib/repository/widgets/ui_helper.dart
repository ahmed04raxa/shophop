import 'package:flutter/material.dart';

class UiHelper {
  static Text customText({
    required String text,
    required double fontSize,
    FontWeight? fontWeight,
    Color? color = Colors.black,
    String? fontFamily,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily ?? "regular",
      ),
    );
  }

  static Image customImage({
    required String imgPath,
    double mWidth = 50,
    double mHeight = 50,
    BoxFit boxFit = BoxFit.cover,
  }) {
    return Image.asset(
      "assets/images/$imgPath",
      width: mWidth,
      height: mHeight,
      fit: boxFit,
    );
  }
}
