// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:product_catalog/config/items/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider/cartProvider.dart';
import '../Widgets/cartItem.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(children: [
        Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Price'),
                    Spacer(),
                    Chip(label: Text("${cart.totalToPay.toString()}\$")),
                    TextButton(onPressed: () {}, child: Text("Order Now",
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),))
                  ]),
            )),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              return CartItemTile(
                id: cart.items.values.toList()[index].id,
                title: cart.items.values.toList()[index].title,
                price: cart.items.values.toList()[index].price,
                quantity: cart.items.values.toList()[index].quantity,
                productId: cart.items.keys.toList()[index]
              );
            },
          ),
        )
      ]),
    );
  }
}
