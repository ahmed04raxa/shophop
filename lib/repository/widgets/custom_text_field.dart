import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double mWidth;
  final double mHeight;
  final TextEditingController controller;
  final Color color;
  final String hintText;
  final Color fillColor;
  final bool fill;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    this.mWidth = 300,
    this.mHeight = 50,
    this.color = Colors.black,
    required this.controller,
    required this.hintText,
    this.fillColor = Colors.transparent,
    this.fill = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mWidth,
      height: mHeight,
      child: TextField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0XFF676767)),
          fillColor: fillColor,
          filled: fill,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: color, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: color, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: color, width: 2),
          ),
        ),
      ),
    );
  }
}
