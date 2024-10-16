import 'package:flutter/material.dart';
import 'package:product_catalog/config/items/app_colors.dart';
import 'package:product_catalog/providers/cart_provider/cartProvider.dart';
import 'package:provider/provider.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile(
      {Key? key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.image,
      required this.productId})
      : super(key: key);
  final String id;
  final String title;
  final double price;
  final int quantity;
  final String productId;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          leading: Image.asset(
            image,
            fit: BoxFit.cover,
            width: 60,
            height: 60,
          ),
          title: Text(title.toString(),
          style: TextStyle(
            fontSize: 20,
            color: AppColors.darkRed
            ,fontWeight: FontWeight.bold
          ),),
          subtitle:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      Provider.of<Cart>(context, listen: false).updateQuantity(productId, false);
                    }
                  },
                ),
                Text(quantity.toString()),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Provider.of<Cart>(context, listen: false).updateQuantity(productId,true);
                  },
                ),
              ],
            ),
            Text(
              "Total: \$${(price * quantity).toStringAsFixed(2)}", 
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              ),
            ),
          ]),
          trailing: IconButton(
              icon: Icon(Icons.delete_outline, color: AppColors.darkRed,
              size: 60,),
              onPressed: () {
                Provider.of<Cart>(context, listen: false).removeItem(productId);
              }),
        ),
      ),
    );
  }
}
