import 'package:flutter/material.dart';
import 'package:shophop/repository/screens/admin/home/admin_home_screen.dart';

class AdminBottomNavScreen extends StatefulWidget {
  const AdminBottomNavScreen({super.key});

  @override
  State<AdminBottomNavScreen> createState() => _AdminBottomNavScreenState();
}

class _AdminBottomNavScreenState extends State<AdminBottomNavScreen> {
  final List _pages = [AdminHomeScreen()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Favourite'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Profile'),
        ],
      ),
    );
  }
}
