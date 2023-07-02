import 'package:flutter/material.dart';
import 'package:remote_manager/data/models/products.dart';

class ProductBox extends StatelessWidget {
  final Product product;
  final void Function()? onPressed;

  const ProductBox({
    super.key,
    required this.product,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(product.color!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(product.image),
        ),
      ),
    );
  }
}
