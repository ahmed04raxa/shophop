import 'package:flutter/material.dart';
import 'package:shophop/domain/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double mWidth;
  final double mHeight;
  final String text;
  final VoidCallback callback;
  const CustomButton({
    super.key,
    this.mWidth = 300,
    this.mHeight = 50,
    required this.callback,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mWidth,
      height: mHeight,
      child: ElevatedButton(
        onPressed: () {
          callback();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
