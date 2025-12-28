import 'package:flutter/material.dart';
import 'package:shophop/repository/screens/cart/cart_screen.dart';
import 'package:shophop/repository/screens/home/home_screen.dart';
import 'package:shophop/repository/screens/settings/settings_screen.dart';
import 'package:shophop/repository/screens/wishlist/wishlist_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  List pages = [HomeScreen(), WishlistScreen(), CartScreen(), SettingsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color(0XFFFFFFFF),
        indicatorColor: Color(0XFFEB3030),
        height: 76,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedIndex: currentIndex,
        destinations: [
          NavigationDestination(
            icon: Image.asset(
              "assets/images/home.png",
              color: Color(0XFF000000),
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Image.asset("assets/images/wishlist.png"),
            icon: Image.asset("assets/images/wishlist.png"),
            label: 'WishList',
          ),
          NavigationDestination(
            selectedIcon: Image.asset("assets/images/shopping-cart.png"),
            icon: Image.asset(
              "assets/images/shopping-cart.png",
              color: Color(0XFF000000),
            ),
            label: 'Cart',
          ),
          NavigationDestination(
            selectedIcon: Image.asset("assets/images/settings.png"),
            icon: Image.asset(
              "assets/images/settings.png",
              color: Color(0XFF000000),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
