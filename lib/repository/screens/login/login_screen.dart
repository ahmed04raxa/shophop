import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shophop/domain/constants/app_colors.dart';
import 'package:shophop/repository/screens/admin/home/admin_home_screen.dart';
import 'package:shophop/repository/screens/home/home_screen.dart';
import 'package:shophop/repository/screens/signup/signup_screen.dart';
import 'package:shophop/repository/widgets/ui_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> login(String username, String email, String password) async {
    if (username == "" || email == "" || password == "") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("All Filed Are Required")));
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
            // GET USR FROM FIREBASE FIRESTORE
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();
        String role = userDoc.get('role');
        if (role == 'admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AdminHomeScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
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
                controller: usernameController,
                hintText: "Enter Username",
              ),
            ],
          ),
          SizedBox(height: 20),
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
              login(
                usernameController.text,
                emailController.text,
                passwordController.text,
              );
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
