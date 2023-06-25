import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_manager/data/models/product_shop.dart';
import 'package:remote_manager/data/models/products.dart';
import 'package:remote_manager/presentation/widgets/product_tile.dart';

class CustomerCart extends StatefulWidget {
  const CustomerCart({super.key});

  @override
  State<CustomerCart> createState() => _CustomerCartState();
}

class _CustomerCartState extends State<CustomerCart> {
  // remove item from cart
  void removeFromCart(Product product) {
    Provider.of<ProductShop>(context, listen: false)
        .removeItemFromCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // heading
              const Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),

              // list of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    // get individual cart items
                    Product eachProduct = value.userCart[index];

                    // return product tile
                    return ProductTile(
                      product: eachProduct,
                      onPressed: () => removeFromCart(eachProduct),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
