
import 'package:flutter/material.dart';

class Product extends ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final String image;
  final double price;
  bool isFavorate;

Product({
  required this.id,
  required this.title,
  required this.description,
  required this.image,
  required this.price,
  this.isFavorate = false,
});
void toggleFavoriteStatus(){
  isFavorate = !isFavorate;
  notifyListeners();
}
}