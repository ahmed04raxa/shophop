import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shophop/firebase_options.dart';
import 'package:shophop/repository/screens/admin/bottomnav/admin_bottom_nav_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://ucehbpuycmbdggzzlanu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVjZWhicHV5Y21iZGdnenpsYW51Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE3MDU4NzUsImV4cCI6MjA3NzI4MTg3NX0.litmrG29NWRdMeGIaP24Ls0z86SUFHoeXSi6JEwNzGE',
  );

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 2, 1, 4)),
        fontFamily: "regular",
      ),
      home: AdminBottomNavScreen(),
    );
  }
}
