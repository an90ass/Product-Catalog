import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product_catalog/config/items/app_colors.dart';
import 'package:product_catalog/config/routes/route_name.dart';
import 'package:product_catalog/providers/products_provider/product.dart';
import 'package:product_catalog/features/Widgets/gridProductItem.dart';
import 'package:product_catalog/providers/products_provider/productsProvider.dart';
import 'package:provider/provider.dart';

class MainShoppingScreen extends StatefulWidget {
  MainShoppingScreen({Key? key}) : super(key: key);

  @override
  State<MainShoppingScreen> createState() => _MainShoppingScreenState();
}

class _MainShoppingScreenState extends State<MainShoppingScreen> {
  bool showFav = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: buildAppBar(context),
      body: ProductsGrid(
        isFav: showFav,
      ),
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

  List<PopupMenuEntry<int>> buildPopupButtons() {
    return [
      PopupMenuItem(
        value: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Filter By Favorite',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.favorite,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ),
      PopupMenuItem(
        value: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Remove Filters',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.remove_circle_outline,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    ];
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
        child: AppBar(
          backgroundColor: AppColors.darkRed,
          title: Text('Product Catalog'),
          centerTitle: true,
          actions: [
            PopupMenuButton<int>(
              onSelected: (int selectedValue) {
                setState(() {
                  if (selectedValue == 0) {
                    showFav = true;
                  } else if (selectedValue == 1) {
                    showFav = false;
                  }
                });
              },
              itemBuilder: (_) => buildPopupButtons(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              color: AppColors.darkRed,
              icon: Icon(Icons.more_vert, color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                final productsProvider =
                    Provider.of<Products>(context, listen: false);
                productsProvider.addProduct();
              },
            ),
            IconButton(onPressed: (){
              Navigator.pushNamed(context, RouteNames.cart);
            }, icon:Icon( Icons.shopping_cart_checkout))
          ],
        ),
      ),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key, required this.isFav});
  final bool isFav;
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    // final availProducts = productData.availProducts;
    final availProducts =
        isFav ? productData.favoriteProducts : productData.availProducts;

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
