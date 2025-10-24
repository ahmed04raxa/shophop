import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shophop/domain/constants/app_colors.dart';
import 'package:shophop/repository/screens/login/login_screen.dart';
import 'package:shophop/repository/widgets/ui_helper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  Future<void> signUp(String email, String password, String username) async {
    if (email == "" || password == "" || username == "") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("All Filed Are Required")));
    } else {
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        // STRORE USERNAME
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
              'uid': userCredential.user!.uid,
              'username': username,
              'email': email,
              'password': password,
              'role': 'user',
            });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
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
            text: "Sign Up",
            callback: () {
              signUp(
                emailController.text,
                passwordController.text,
                usernameController.text,
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
                text: "Already Have An Account?",
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              Uihelper.customTextButton(
                text: "Login",
                color: AppColors.buttonBackgroundColor,
                fontSize: 14,
                fontFamily: "bold",
                fontWeight: FontWeight.bold,
                callback: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
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
