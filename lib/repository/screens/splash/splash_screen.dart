import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shophop/domain/constants/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      //Navigator.pushReplacementNamed(context, "/login");
      Navigator.pushReplacementNamed(context, AppRoutes.onBoardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset("assets/images/logo.png")));
  }
}
