import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shophop/firebase_options.dart';
import 'package:shophop/repository/screens/admin/bottomnav/admin_bottom_nav_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: "https://gusrsyvfqrwqcldytgnd.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd1c3JzeXZmcXJ3cWNsZHl0Z25kIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE0OTI2MDksImV4cCI6MjA3NzA2ODYwOX0.a9plpI5Ta0iYpIc_gruc5KPayTNIM0nSbdIcCX7-SLE",
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "regular",
      ),
      home: AdminBottomNavScreen(),
    );
  }
}
