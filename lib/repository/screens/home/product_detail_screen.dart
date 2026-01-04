import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shophop/domain/constants/app_colors.dart';
import 'package:shophop/models/product.dart';
import 'package:shophop/provider/cart_provider.dart';
import 'package:shophop/repository/widgets/add_to_cart.dart';
import 'package:shophop/repository/widgets/ui_helper.dart';

class ProductDetailScreen extends StatelessWidget {
  // final Map<String, dynamic> product;
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Scaffold(
      backgroundColor: Color(0XFFFDFDFD),
      appBar: AppBar(
        backgroundColor: Color(0XFFFDFDFD),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            product.imgPath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: UiHelper.customText(
              text: product.name,
              fontSize: 24,
              fontFamily: "bold",
            ),
          ),
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.description,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: UiHelper.customText(
              text: product.price,
              fontSize: 24,
              fontFamily: "bold",
            ),
          ),
        ],
      ),
      floatingActionButton: AddToCart(product: product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
