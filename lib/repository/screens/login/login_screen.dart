import 'package:flutter/material.dart';
import 'package:shophop/domain/constants/app_colors.dart';
import 'package:shophop/repository/screens/signup/signup_screen.dart';
import 'package:shophop/repository/widgets/ui_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper.customTextField(
                controller: emailController,
                hintText: "Enter Your Email",
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper.customTextField(
                controller: passwordController,
                hintText: "Enter Your Password",
              ),
            ],
          ),
          SizedBox(height: 20),
          Uihelper.CustomButton(
            text: "Login",
            callback: () {},
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(width: 30),
              Uihelper.customText(
                text: "Don't Have Account?",
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              Uihelper.customTextButton(
                text: "Sign Up",
                color: AppColors.buttonBackgroundColor,
                fontSize: 15,
                fontFamily: "bold",
                fontWeight: FontWeight.bold,
                callback: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
