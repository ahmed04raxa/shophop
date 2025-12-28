import 'package:flutter/material.dart';
import 'package:shophop/repository/screens/bottomnav/bottom_nav_screen.dart';
import 'package:shophop/repository/screens/forgot/forgot_password_screen.dart';
import 'package:shophop/repository/screens/login/login_screen.dart';
import 'package:shophop/repository/screens/onboarding/on_boarding_screen.dart';
import 'package:shophop/repository/screens/signup/sign_up_screen.dart';
import 'package:shophop/repository/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = "/splashScreen";
  static const String loginScreen = "/login";
  static const String signUpScreen = "/signup";
  static const String onBoardingScreen = "/onBoardingScreen";
  static const String forgotPasswordScreen = "/forgotPasswordScreen";
  static const String bottomNavScreen = "/bottomNavScreen";

  static Map<String, Widget Function(BuildContext)> getRoutes() => {
    splashScreen: (context) => SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    signUpScreen: (context) => SignUpScreen(),
    onBoardingScreen: (context) => OnBoardingScreen(),
    forgotPasswordScreen : (context) => ForgotPasswordScreen(),
    bottomNavScreen : (context) => BottomNavScreen()
  };
}
