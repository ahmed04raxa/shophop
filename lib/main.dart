import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shophop/domain/constants/app_routes.dart';
import 'package:shophop/provider/cart_provider.dart';
import 'package:shophop/provider/favourite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => FavouriteProvider()),
    ],
    child: MaterialApp(
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
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.getRoutes(),
    ),
  );
}
