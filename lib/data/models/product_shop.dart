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
        description:
            'Geared for serious gaming and real-world durability, the TUF Gaming A15 is a fully-loaded Windows 10 Pro gaming laptop that can carry you to victory. Powered by the latest AMD Ryzen™ 9 CPU and GeForce RTX™ 2060 GPU, action-packed gameplay is fast, fluid, and fully saturates speedy IPS-level displays up to 144Hz.',
        color: 0xffE4F2FB),
    Product(
        name: 'MacBook Pro M1',
        image: 'assets/images/macbook_pro_m1.png',
        price: '1,599\$',
        description:
            "Apple's powerful M1 chip with an 8-core CPU and 8-core GPU, plus 8GB of unified memory (RAM)",
        color: 0xffFDE1E6),
    Product(
        name: 'Ipad Pro (4th gen)',
        image: 'assets/images/ipad_pro_4th_gen.png',
        price: '899\$',
        description:
            'The 2020 model features an Apple A12Z processor, with an octa-core CPU and GPU, support for Wi-Fi 6, and an upgraded camera setup with a 12MP wide camera, a 10MP ultra-wide camera, and a lidar scanner for augmented reality',
        color: 0xff00797A),
    Product(
        name: 'Airpods',
        image: 'assets/images/airpods.png',
        price: '150\$',
        description:
            'Apple AirPods Wireless Earbuds with Lightning Charging Case. Spatial Audio, Sweat and Water Resistant, Up to 30 Hours of Battery Life',
        color: 0xff969488),
    Product(
        name: 'Apple watch series 8',
        image: 'assets/images/apple_watch_series_8.png',
        price: '399\$',
        description:
            'Understand your cycle like never before. Apple Watch Series 8 has an innovative sensor that tracks your temperature while you sleep, so you can see changes over time. Cycle Tracking uses this data to provide a retrospective estimate of when you likely ovulated, which can be helpful for family planning. When combined with your heart rate and logged cycle data, you’ll get a detailed view of your menstrual cycle.',
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

// get recentlyviewed items
  List<Product> get recentlyviewed => _recentlyViewed;

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

  void addItemToRecentlyViewed(Product product) {
    _recentlyViewed.add(product);
    notifyListeners();
  }
}
