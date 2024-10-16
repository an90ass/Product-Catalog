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
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      )),
      body: Column(children: [
        buildTitle(),
     

        Card(
            color: AppColors.darkRed,
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Chip(label: Text("${cart.totalToPay.toString()}\$")),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Order Now",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  ]),
            )),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  "Orders",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkRed,
                  ),
                ),
                Icon(
                  Icons.arrow_downward,
                  color: AppColors.darkRed,
                )
              ],
            ),
          ),
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
                  image: cart.items.values.toList()[index].image,

                  productId: cart.items.keys.toList()[index]);
            },
          ),
        )
      ]),
    );
  }
  
  buildTitle() {
    return
    Padding(
      
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Yoru Cart",
          style: TextStyle(
              color: AppColors.black53,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
      ),
    );
  }
}
