// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider/cartProvider.dart';

class CartScreen extends StatelessWidget{
  const CartScreen({Key? key}): super(key: key);
  Widget build(BuildContext context) {
      final cart =Provider.of<Cart>(context);

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
                Text('Product Name'),
                Spacer(),
                Chip(label: Text("${cart.totalToPay.toString()}")),
                TextButton(onPressed: (){}, child: Text("Order Now"))
              ]
            ),
          )
        )
      ]),
    );
    }

}