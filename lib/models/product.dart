class Product {
  final String imgPath;
  final String name;
  final String description;
  final String price;
  int quantity;
  Product({
    required this.imgPath,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
  });
}

final List<Product> products = [
  Product(
    imgPath: "assets/images/Mask Group.png",
    name: "Women Printed Kurta",
    description: "Neque porro quisquam",
    price: "\$ 23",
    quantity: 1,
  ),
  Product(
    imgPath: "assets/images/Mask Group (1).png",
    name: "Women Printed Kurta",
    description: "Neque porro quisquam",
    price: "\$ 23",
    quantity: 1,
  ),
  Product(
    imgPath: "assets/images/Mask Group (2).png",
    name: "HRX by Hrithik Roshan",
    description: "Neque porro quisquam",
    price: "\$ 23",
    quantity: 1,
  ),
  Product(
    imgPath: "assets/images/Mask Group (3).png",
    name: "Philips BHH880/10",
    description: "Neque porro quisquam",
    price: "\$ 23",
    quantity: 1,
  ),
];
