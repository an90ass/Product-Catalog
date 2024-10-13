import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product_catalog/features/Models/product.dart';
import 'package:product_catalog/features/Widgets/gridProductItem.dart';
import 'package:product_catalog/providers/productsProvider.dart';
import 'package:provider/provider.dart';

class MainShoppingScreen extends StatelessWidget {
  MainShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // _showAddProductDialog(context);
                final productsProvider =
                    Provider.of<Products>(context, listen: false);
                productsProvider.addProduct();
              }),
        ],
      ),
      body: ProductsGrid(),
    ));
  }

  void _showAddProductDialog(BuildContext context) {
    final idController = TextEditingController();
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final imageController = TextEditingController();
    final priceController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add New Product'),
            content: SingleChildScrollView(
                child: Column(
              children: [
                TextField(
                  controller: idController,
                  decoration: InputDecoration(labelText: 'ID'),
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                TextField(
                  controller: imageController,
                  decoration: InputDecoration(labelText: 'Image Path'),
                ),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Price'),
                ),
              ],
            )),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  final newProduct = Product(
                    id: idController.text,
                    title: titleController.text,
                    description: descriptionController.text,
                    image: imageController.text,
                    price: double.tryParse(priceController.text) ?? 0,
                  );
                  final addProduct =
                      Provider.of<Products>(context, listen: false);
                  addProduct.addProduct();
                  Navigator.of(context).pop();
                },
                child: Text('Add'),
              ),
            ],
          );
        });
  }
}

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final availProducts = productData.availProducts;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: availProducts.length,
      // itemBuilder: (context, index) {
      //   return ChangeNotifierProvider<Product>(
      //     create: (BuildContext context) { 
      //       return availProducts[index];
      //      },
      //     child: GridProductItem(
      //         // id: availProducts[index].id,
      //         // title: availProducts[index].title,
      //         // image: availProducts[index].image),
        
      //    ) );
      // },
       itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: availProducts[index], // Using .value for existing objects
          child: GridProductItem(),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 30),
    );
  }
}
