import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/homescreen/quantity_selector.dart';
import '../providers/cart_provider.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {required this.imagePath,
      required this.price,
      required this.productName,
      required this.quantity,
      required this.totalPrice,
      Key? key})
      : super(key: key);

  final String productName;
  final String imagePath;
  final int price;
  final int quantity;
  final int totalPrice;
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 83,
                child: Center(
                  child: Image.network(imagePath),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 83,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '₹${price.toString()}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Qty: ${quantity.toString()}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                  height: 83,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 32),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            cartProvider.deleteCartItem(productName);
                          },
                          icon: const Icon(Icons.delete)),
                      QuantitySelector(
                          productName: productName,
                          imagePath: imagePath,
                          price: price),
                    ],
                  )),
            ),
          ],
        ),
        const Divider(
          height: 1,
          color: Colors.black45,
        )
      ],
    );
  }
}
