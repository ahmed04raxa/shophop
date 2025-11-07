import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shophop/repository/screens/admin/products/add_product.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  Future<void> deleteProduct(String docId) async {
    await FirebaseFirestore.instance.collection("Products").doc(docId).delete();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Product Deleted Successfully")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF2F2F2),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Products").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No products found"));
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 400,
                      color: Colors.pink,
                      child: Row(
                        children: [
                          Image.network(
                            snapshot.data!.docs[index]['imageUrl'],
                          ),
                        ],
                      ),
                    ),
                    Text("${index + 1}"),
                    Text("${snapshot.data!.docs[index]['name']}"),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {},
                        ),
                        IconButton(
                          // DELETE KRNA BHI SIKH LIA
                          onPressed: () async {
                            await deleteProduct(snapshot.data!.docs[index].id);
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );

          // return ListView.builder(
          //   itemCount: snapshot.data!.docs.length,
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       leading: CircleAvatar(child: Text("${index + 1}")),
          //       title: Text("${snapshot.data!.docs[index]['name']}"),
          //       subtitle: Text("${snapshot.data!.docs[index]['description']}"),
          //       trailing: Row(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           IconButton(
          //             icon: Icon(Icons.edit, color: Colors.blue),
          //             onPressed: () {},
          //           ),
          //           IconButton(
          //             // DELETE KRNA BHI SIKH LIA
          //             onPressed: () async {
          //               await deleteProduct(snapshot.data!.docs[index].id);
          //             },
          //             icon: Icon(Icons.delete, color: Colors.red),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // );
          //
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProduct()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
