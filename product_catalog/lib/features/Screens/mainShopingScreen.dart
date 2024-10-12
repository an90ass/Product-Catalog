import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product_catalog/features/Widgets/gridProductItem.dart';

import '../Models/product.dart';

class MainShoppingScreen extends StatelessWidget {
  MainShoppingScreen({Key? key}) : super(key: key);
  final List<Product> availProducts = [
    Product(
        id: '1001',
        title: 'Samsung',
        description: "it's a phone",
        image: 'assets/images/samsung.jpeg',
        price: 1000),
    Product(
        id: '1002',
        title: 'iphone',
        description: "it's a phone",
        image: 'assets/images/iphone.jpg',
        price: 1000),
    Product(
        id: '1003',
        title: 'realme',
        description: "it's a phone",
        image: 'assets/images/realme.jpeg',
        price: 1000),
    Product(
        id: '1004',
        title: 'nokia',
        description: "it's a phone",
        image: 'assets/images/nokia.jpg',
        price: 1000),
    Product(
        id: '1005',
        title: 'oneplus',
        description: "it's a phone",
        image: 'assets/images/oneplus.jpeg',
        price: 1000),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(

            title: Text('Product Catalog'),
            centerTitle: true,
          ),
          
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: availProducts.length,
        itemBuilder: (context, index) {
          return GridProductItem(id: availProducts[index].id, title: availProducts[index].title, image: availProducts[index].image);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 30),
      ),
    ));
  }
}
