import 'package:flutter/material.dart';
import 'package:shophop/domain/constants/app_routes.dart';
import '../../../domain/constants/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/ui_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiHelper.customText(
              text: "Create an\naccount",
              fontSize: 36,
              fontFamily: "bold",
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            CustomTextField(
              mWidth: 332,
              mHeight: 60,
              controller: emailController,
              hintText: "Email",
              prefixIcon: Icon(
                Icons.person_3_rounded,
                color: Color(0XFF626262),
              ),
              fillColor: AppColors.textFieldFilledColor,
              fill: true,
              color: AppColors.textFieldOutlineColor,
            ),
            SizedBox(height: 20),
            CustomTextField(
              mWidth: 332,
              mHeight: 57,
              controller: passwordController,
              prefixIcon: Icon(Icons.lock, color: Color(0XFF626262)),
              hintText: "Password",
              fillColor: AppColors.textFieldFilledColor,
              fill: true,
              color: AppColors.textFieldOutlineColor,
            ),
            SizedBox(height: 40),
            CustomButton(
              mWidth: 332,
              mHeight: 56,
              callback: () {},
              text: "Create Account",
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customText(
                  text: "- OR Continue with -",
                  fontSize: 12,
                  color: AppColors.textLightGrey,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customImage(imgPath: "Facebook.png"),
                SizedBox(width: 10),
                UiHelper.customImage(imgPath: "Apple.png"),
                SizedBox(width: 10),
                UiHelper.customImage(imgPath: "Google.png"),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.customText(
                  text: "I Already Have an Account",
                  fontSize: 14,
                  color: AppColors.textLightGrey,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.loginScreen,
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: AppColors.textColorRed,
                      fontSize: 14,
                      fontFamily: "bold",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
