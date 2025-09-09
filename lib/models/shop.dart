import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app1/models/product.dart';

class Shop extends ChangeNotifier{
  // products for sale
  final List<Product> _shop = [

    // product 1
  Product(
  name: 'Glasses', 
  price: 55.55,
  description: 'Stylish and lightweight eyewear that combines comfort with modern design.Perfect for daily wear or special occasions.', 
  imagePath: 'assets/images/glass.png',
),

// product 2
Product(
  name: 'Hoodies', 
  price: 100,
  description: 'Cozy and trendy hoodie made from soft,breathable fabric.Ideal for layering or lounging in style.', 
  imagePath: 'assets/images/hoodie.png', 
),

// product 3
Product(
  name: 'Shoes', 
  price: 115,
  description: 'Durable and fashionable shoes designed for comfort and performance.Perfect for casual outings or sports activities.', 
  imagePath: 'assets/images/shoe.png',
),

// product 4
Product(
  name: 'Watches', 
  price: 20.2,
  description: 'Elegant and reliable wristwatch with a sleek design. Adds a touch of sophistication to any outfit.', 
  imagePath: 'assets/images/watch.png',
),


    
  ];

  // user cart
  final List<Product> _cart =[];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart=> _cart;

  // add item to list
  void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }

  // remove item from list
  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }

 
}