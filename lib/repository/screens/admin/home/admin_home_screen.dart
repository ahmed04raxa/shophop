import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:shophop/repository/screens/admin/product/add_product_screen.dart';
import 'package:shophop/repository/screens/admin/profile/admin_profile_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminProfileScreen()),
                );
              },
              icon: Icon(CupertinoIcons.profile_circled),
            ),
          ],
        ),
        body: Column(children: []),
        floatingActionButton: FloatingActionButton(
          child: LineIcon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProductScreen()),
            );
          },
        ),
      ),
    );
  }
}
