import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shophop/domain/constants/app_colors.dart';
import 'package:shophop/repository/screens/home/home_screen.dart';
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
  Future<void> login(String email, String password) async {
    if (email == "" || password == "") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("All Filed Are Required")));
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((v) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            });
      } on FirebaseAuthException catch (ex) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(ex.code.toString())));
      }
    }
  }
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
            callback: () {
              login(emailController.text, passwordController.text);
            },
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
