import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shophop/repository/widgets/ui_helper.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  Future<void> addProduct(
    String name,
    String price,
    String description,
    String brand,
    String category,
  ) async {
    if (name == "" ||
        price == "" ||
        description == "" ||
        brand == "" ||
        category == "") {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("All Fields Are Required!")));
      
    } else {
      await FirebaseFirestore.instance.collection("Products").doc().set({
        'name': name,
        'price': price,
        'description': description,
        'brand': brand,
        'category': category,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper.customTextField(
                controller: nameController,
                hintText: "Enter Product Name",
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper.customTextField(
                controller: priceController,
                hintText: "Enter Product Price",
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper.customTextField(
                controller: descriptionController,
                hintText: "Enter Product Description",
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper.customTextField(
                controller: brandController,
                hintText: "Enter Product Brand Name",
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper.customTextField(
                controller: categoryController,
                hintText: "Enter Product Catergory",
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper.CustomButton(
                text: "Add Product",
                callback: () {
                  addProduct(
                    nameController.text,
                    priceController.text,
                    descriptionController.text,
                    brandController.text,
                    categoryController.text,
                  );
                },
                fontSize: 22,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
