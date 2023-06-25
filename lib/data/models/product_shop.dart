import 'package:flutter/material.dart';
import 'package:remote_manager/data/models/products.dart';

class ProductShop extends ChangeNotifier {
  var products = [
    Product(name: 'Headset', image: 'assets/images/headphones.png'),
    Product(name: 'Earphone', image: 'assets/images/earphones.png'),
    Product(name: 'laptop', image: 'assets/images/laptop.png'),
  ];

  final List<Product> hotSales = [
    Product(
        name: 'Asus Tuf A15 ',
        image: 'assets/images/asus_tuff_a15.png',
        price: '1,499\$',
        color: 0xffE4F2FB),
    Product(
        name: 'MacBook Pro M1',
        image: 'assets/images/macbook_pro_m1.png',
        price: '1,599\$',
        color: 0xffFDE1E6),
    Product(
        name: 'Ipad Pro (4th gen)',
        image: 'assets/images/ipad_pro_4th_gen.png',
        price: '899\$',
        color: 0xff00797A),
    Product(
        name: 'Airpods',
        image: 'assets/images/airpods.png',
        price: '150\$',
        color: 0xff969488),
    Product(
        name: 'Apple watch series 8',
        image: 'assets/images/apple_watch_series_8.png',
        price: '399\$',
        color: 0xffF9534D),
  ];

// recently viewed
  final List<Product> _recentlyViewed = [];

// user cart
  final List<Product> _userCart = [];

// get product list
  List<Product> get productShop => hotSales;

// get user cart
  List<Product> get userCart => _userCart;

// add item to cart
  void addItemToCart(Product product) {
    _userCart.add(product);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Product product) {
    _userCart.remove(product);
    notifyListeners();
  }
}
