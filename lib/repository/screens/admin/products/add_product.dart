import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shophop/domain/constants/app_colors.dart';
import 'package:shophop/repository/screens/admin/home/admin_home_screen.dart';
import 'package:shophop/repository/widgets/ui_helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  // TO PICK IMAGE
  final ImagePicker imagePicker = ImagePicker();
  // TO SHOW / PREVIEW IMAGE
  File? imageFile;
  // TO STORE IMAGE URL IN FIREBASE FIRESTORE
  String? imageUrl;
  // NEW METHOD TO UPLOAD IMAGE AND PRODUCT DATA
  Future<void> pickImage() async {
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  Future<void> addProducts() async {
    if (imageFile == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please Select Image First")));
      return;
    }
    final name = nameController.text.trim();
    final price = priceController.text.trim();
    final description = descriptionController.text.trim();
    final brand = brandController.text.trim();
    final category = categoryController.text.trim();
    if (name.isEmpty ||
        price.isEmpty ||
        description.isEmpty ||
        brand.isEmpty ||
        category.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("All fields are required!")));
      return;
    }
    try {

      // Upload image to Sup abase Storage
      final fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
      final filePath = 'productImages/$fileName';

      await Supabase.instance.client.storage
          .from('productImages')
          .upload(filePath, imageFile!);
      // 🔹 2. Get public URL
      final publicUrl = Supabase.instance.client.storage
          .from('productImages')
          .getPublicUrl(filePath);
      setState(() {
        imageUrl = publicUrl;
      });

      // Save product data to Firestore
      await FirebaseFirestore.instance.collection("Products").add({
        'name': name,
        'price': price,
        'description': description,
        'brand': brand,
        'category': category,
        'imageUrl': publicUrl,
        'createdAt': Timestamp.now(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product added successfully!")),
      );

      // Navigate to AdminHomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminHomeScreen()),
      );
    } catch (ex) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $ex")));
    }
  }

  // UPLOAD IMAGE ON SUP ABASE

  // Future<void> uploadImageOnSup abase() async {
  //   if (imageFile == null) return;
  //   // GENERATE A UNIQUE FILE PATH
  //   final fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
  //   final filePath = 'productImages/$fileName';
  //   // UPLOAD
  //   await Sup abase.instance.client.storage
  //       .from('productImages')
  //       .upload(filePath, imageFile!)
  //       .then((v) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text("Images Uploaded Successfully!")),
  //         );
  //       });
  // }
  //
  // Future<void> addProduct(
  //   String name,
  //   String price,
  //   String description,
  //   String brand,
  //   String category,
  // ) async {
  //   if (name.isEmpty ||
  //       price.isEmpty ||
  //       description.isEmpty ||
  //       brand.isEmpty ||
  //       category.isEmpty ||
  //       imageUrl == null) {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text("All Fields Are Required!")));
  //   } else {
  //     await FirebaseFirestore.instance
  //         .collection("Products")
  //         .doc()
  //         .set({
  //           'name': name,
  //           'price': price,
  //           'description': description,
  //           'brand': brand,
  //           'category': category,
  //           'imageUrl': imageUrl,
  //         })
  //         .then((v) {
  //           Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(builder: (context) => AdminHomeScreen()),
  //           );
  //         });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ElevatedButton(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: AppColors.buttonBackgroundColor,
          //   ),
          //   child: Text(
          //     "Upload Image",
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: imageFile != null
                      ? FileImage(imageFile!)
                      : null,
                ),

                ElevatedButton(
                  onPressed: () {
                    pickImage();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBackgroundColor,
                  ),
                  child: Text(
                    "Add Image",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                callback: () async {
                  await addProducts();
                  // await addProduct(
                  //   nameController.text,
                  //   priceController.text,
                  //   descriptionController.text,
                  //   brandController.text,
                  //   categoryController.text,
                  // );
                },
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
