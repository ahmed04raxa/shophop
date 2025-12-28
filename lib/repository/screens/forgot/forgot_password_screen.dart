import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../domain/constants/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/ui_helper.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFFFFFFF),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back, size: 30),
        ),
      ),
      backgroundColor: Color(0XFFFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiHelper.customText(
              text: "Forgot \npassword?",
              fontSize: 36,
              fontFamily: "bold",
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            CustomTextField(
              mWidth: 332,
              mHeight: 60,
              controller: passwordController,
              hintText: "Enter your email address",
              prefixIcon: Icon(Icons.mail_rounded, color: Color(0XFF626262)),
              fillColor: AppColors.textFieldFilledColor,
              fill: true,
              color: AppColors.textFieldOutlineColor,
            ),
            SizedBox(height: 40),
            CustomButton(
              mWidth: 332,
              mHeight: 56,
              callback: () {},
              text: "Submit",
            ),
          ],
        ),
      ),
    );
  }
}
