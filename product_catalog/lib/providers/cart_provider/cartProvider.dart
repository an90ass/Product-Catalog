import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final String image;
  final int quantity;

  CartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.image,
      
      required this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem({required String productId, price, title,image}) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              image:value.image,
              quantity: value.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title.toString(),
                            image:image,

              price: price,
              quantity: 1));
      notifyListeners();
    }
  }

  double get totalToPay {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });

    return total;
  }
  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }
 void updateQuantity(String productId, bool isIncrement) {
  if (_items.containsKey(productId)) {
    if (isIncrement) {
      // زيادة الكمية
      _items.update(
          productId,
          (existingItem) => CartItem(
                id: existingItem.id,
                title: existingItem.title,
                price: existingItem.price,
                image: existingItem.image,
                quantity: existingItem.quantity + 1,
              ));
    } else {
      // تقليل الكمية
      if (_items[productId]!.quantity > 1) {
        _items.update(
            productId,
            (existingItem) => CartItem(
                  id: existingItem.id,
                  title: existingItem.title,
                  price: existingItem.price,
                  image: existingItem.image,
                  quantity: existingItem.quantity - 1,
                ));
      } else {
        removeItem(productId); // حذف العنصر إذا أصبحت الكمية صفر
      }
    }
    notifyListeners();
  }
}


}
