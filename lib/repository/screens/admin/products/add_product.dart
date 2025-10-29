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

  // TO PICK IMAMGE
  final ImagePicker imagePicker = ImagePicker();
  // TO SHOW / PREVIEW IMAGE
  File? imageFile;

  Future<void> pickImage() async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  // UPLOAD IMAGE ON SUPABASE

  Future<void> uploadImageOnSupabase() async {
    if (imageFile == null) return;
    // GENERATE A UNIQUE FILE PATH
    final fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
    final filePath = 'productImages/$fileName';
    // UPLOAD
    await Supabase.instance.client.storage
        .from('productImages')
        .upload(filePath, imageFile!)
        .then((v) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Images Uploaded Successfuly!")),
          );
        });
  }

  Future<void> addProduct(
    String name,
    String price,
    String description,
    String brand,
    String category,
  ) async {
    if (name.isEmpty ||
        price.isEmpty ||
        description.isEmpty ||
        brand.isEmpty ||
        category.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("All Fields Are Required!")));
    } else {
      await FirebaseFirestore.instance
          .collection("Products")
          .doc()
          .set({
            'name': name,
            'price': price,
            'description': description,
            'brand': brand,
            'category': category,
          })
          .then((v) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AdminHomeScreen()),
            );
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
          ElevatedButton(
            onPressed: () {
              uploadImageOnSupabase();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonBackgroundColor,
            ),
            child: Text(
              "Upload Image",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
                  await addProduct(
                    nameController.text,
                    priceController.text,
                    descriptionController.text,
                    brandController.text,
                    categoryController.text,
                  );
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
