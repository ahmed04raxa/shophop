import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shophop/firebase_options.dart';
import 'package:shophop/repository/screens/admin/bottomnav/admin_bottom_nav_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "regular",
      ),
      home: AdminBottomNavScreen(),
    );
  }
}
