import 'package:flutter/material.dart';
import 'package:shophop/models/product.dart';
import 'package:shophop/repository/screens/home/product_detail_screen.dart';
import 'package:shophop/repository/widgets/ui_helper.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(product.imgPath),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite_border_rounded,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
          UiHelper.customText(
            text: product.name,
            fontSize: 12,
            fontFamily: "bold",
          ),
          SizedBox(height: 7),
          UiHelper.customText(text: product.description, fontSize: 10),
          SizedBox(height: 7),
          UiHelper.customText(text: product.price, fontSize: 12),
        ],
      ),
    );
  }
}
