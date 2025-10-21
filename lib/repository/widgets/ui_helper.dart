import 'package:flutter/material.dart';
import 'package:shophop/domain/constants/app_colors.dart';

class Uihelper {
  static customImage({required String imgUrl}) {
    return Image.asset("assets/images/$imgUrl");
  }

  static customTextField({
    required TextEditingController controller,
    required String hintText,
    IconData? suffixIcon,
  }) {
    return SizedBox(
      height: 52,
      width: 375,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(suffixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.headingColor),
          ),
        ),
      ),
    );
  }

  static CustomButton({
    required String text,
    required VoidCallback callback,
    FontWeight? fontWeight,
    required double fontSize,
    Color? color = Colors.black,
    String? fontFamily = "regular",
  }) {
    return Container(
      width: 375,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBackgroundColor,
        ),
        onPressed: callback,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            color: color,
          ),
        ),
      ),
    );
  }

  static customTextButton({
    required String text,
    required VoidCallback callback,
    FontWeight? fontWeight,
    required double fontSize,
    Color? color = Colors.black,
    String? fontFamily = "regular",
  }) {
    return TextButton(
      onPressed: callback,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }

  static customText({
    required String text,
    required FontWeight fontWeight,
    required double fontSize,
    Color? color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
