import 'package:flutter/material.dart';
import 'package:product_catalog/providers/cart_provider/cartProvider.dart';
import 'package:provider/provider.dart';

class CartItemTile extends StatelessWidget{
  const CartItemTile({Key? key, required this.id,required this.price,required this.quantity,required this.title, required this.productId}):super(key: key);
    final String id;
  final String title;
  final double price;
  final int quantity;
  final String productId;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: ListTile(
        leading:Text(price.toString()) ,


        title: Text(title.toString()),
        subtitle: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("x${quantity.toString()}")
            ,Text("${price*quantity}")


          
        ]),
        trailing:
        IconButton(icon: Icon(Icons.delete_outline),
        onPressed: () {
          Provider.of<Cart>(context,listen: false).removeItem(productId);
        }
        ) ,
      ),

    );
  }

}