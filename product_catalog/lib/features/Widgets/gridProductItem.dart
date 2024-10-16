import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product_catalog/providers/cart_provider/cartProvider.dart';
import 'package:product_catalog/providers/products_provider/product.dart';
import 'package:provider/provider.dart';

import '../../config/items/app_colors.dart';
import '../../config/routes/route_name.dart';

class GridProductItem extends StatelessWidget {
  const GridProductItem({
    Key? key,
  }) : super(key: key);

//  final String id,title,image;
  @override
  Widget build(BuildContext context) {
   // final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return Consumer<Product>(
      builder: (context,product,_){

      
      return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context, RouteNames.productDetails,
                arguments: product.id, // Passing product ID
              );
            },
            child: Image.asset(
              product.image,
            ),
          ),
          footer: GridTileBar(
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            backgroundColor: AppColors.black53,
            leading: IconButton(
                icon: product.isFavorite
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                onPressed: () {
                  product.toggleFavoriteStatus();
                }),
            trailing:
                IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
                  cart.addItem(productId: product.id,price: product.price,title: product.title);
                }),
          ),
        ),
      );
    });
  }
}
