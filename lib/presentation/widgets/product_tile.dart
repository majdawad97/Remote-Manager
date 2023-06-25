import 'package:flutter/material.dart';
import 'package:remote_manager/data/models/products.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final void Function()? onPressed;
  const ProductTile({
    super.key,
    required this.product,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(product.name),
        subtitle: Text(product.price!),
        leading: Image.asset(product.image),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
