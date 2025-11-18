import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shophop/repository/screens/cart/cart_screen.dart';
import 'package:shophop/repository/screens/favourite/favourite_screen.dart';
import 'package:shophop/repository/screens/home/home_screen.dart';
import 'package:shophop/repository/screens/profile/profile_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _pages = [
    HomeScreen(),
    CartScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: SafeArea(
        child: GNav(
          gap: 8,
          activeColor: Colors.white,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.blue,
          onTabChange: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          tabs: [
            GButton(icon: LineIcons.home, text: "HOME"),
            GButton(icon: LineIcons.shoppingBag, text: "CARTS"),
            GButton(icon: LineIcons.heart, text: "FAVOURITE"),
            GButton(icon: LineIcons.user, text: "PROFILE"),
          ],
        ),
      ),
    );
  }
}
