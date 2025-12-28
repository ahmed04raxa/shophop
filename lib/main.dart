import 'package:flutter/material.dart';
import 'package:shophop/domain/constants/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Hop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "regular",
      ),
      // initialRoute: "/login",
      // routes: {
      //   "/splashScreen": (context) => SplashScreen(),
      //   "/login": (context) => LoginScreen(),
      //   "/signup": (context) => SignUpScreen(),
      // },
      initialRoute: AppRoutes.bottomNavScreen,
      routes: AppRoutes.getRoutes(),
    );
  }
}
