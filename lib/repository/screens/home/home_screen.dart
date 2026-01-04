import 'package:flutter/material.dart';
import 'package:shophop/models/product.dart';
import 'package:shophop/repository/screens/home/product_detail_screen.dart';
import 'package:shophop/repository/widgets/product_card.dart';
import 'package:shophop/repository/widgets/ui_helper.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> mProducts = [
    {
      "imgPath": "assets/images/Mask Group.png",
      "name": "Women Printed Kurta",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": "23",
    },
    {
      "imgPath": "assets/images/Mask Group (1).png",
      "name": "HRX by Hrithik Roshan",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": "PKR-23",
    },
    {
      "imgPath": "assets/images/Mask Group (2).png",
      "name": "Philips BHH880/10",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": "PKR-23",
    },
    {
      "imgPath": "assets/images/Mask Group (3).png",
      "name": "TITAN Men Watch- 1806N",
      "description": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": "PKR-23",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFDFDFD),
      appBar: AppBar(
        backgroundColor: Color(0XFFFDFDFD),
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 32,
            backgroundColor: Color(0XFFF2F2F2),
            child: Icon(Icons.menu, color: Color(0XFF323232), size: 32),
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 40,
            child: UiHelper.customImage(imgPath: "user.png"),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Container(
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Icon(Icons.search, color: Color(0XFFBBBBBB)),
                  suffixIcon: Icon(Icons.mic, color: Color(0XFFBBBBBB)),
                  filled: true,
                  fillColor: Color(0XFFFFFFFF),
                  hintText: "Search any Product..",
                  hintStyle: TextStyle(color: Color(0XFFBBBBBB)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  SizedBox(
                    height: 190,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset("assets/images/banner.png"),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: UiHelper.customText(
                      text: "50-40% OFF",
                      fontSize: 20,
                      fontFamily: "bold",
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 20,
                    child: UiHelper.customText(
                      text: "Now in (product)",
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 20,
                    child: UiHelper.customText(
                      text: "All colours",
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 20,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                          side: BorderSide(width: 2, color: Colors.white),
                        ),
                      ),
                      child: UiHelper.customText(
                        text: "Shop Now",
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  UiHelper.customText(
                    text: "All Products",
                    fontSize: 18,
                    fontFamily: "bold",
                  ),
                  Spacer(),
                  Container(
                    width: 65,
                    height: 24,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 11,
                  mainAxisSpacing: 11,
                  childAspectRatio: 2 / 2.5,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                  // return Container(
                  //   height: 241,
                  //   width: 170,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(4),
                  //   ),
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 16),
                  //     child: GestureDetector(
                  //       onTap: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => ProductDetailScreen(
                  //               product: mProducts[index],
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Stack(
                  //             children: [
                  //               ClipRRect(
                  //                 borderRadius: BorderRadius.circular(4),
                  //                 child: Image.asset(mProducts[index]['imgPath'],),
                  //               ),
                  //               Positioned(
                  //                 top: 8,
                  //                 right: 8,
                  //                 child: CircleAvatar(
                  //                   radius: 14,
                  //                   backgroundColor: Colors.white,
                  //                   child: Icon(
                  //                     Icons.favorite_border_rounded,
                  //                     size: 20,
                  //                     color: Colors.red,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           SizedBox(height: 7),
                  //           UiHelper.customText(
                  //             text: mProducts[index]['name'],
                  //             fontSize: 12,
                  //             fontFamily: "bold",
                  //           ),
                  //           SizedBox(height: 7),
                  //           UiHelper.customText(
                  //             text: mProducts[index]['description'],
                  //             fontSize: 10,
                  //           ),
                  //           SizedBox(height: 7),
                  //           UiHelper.customText(
                  //             text: mProducts[index]['price'],
                  //             fontSize: 12,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
