import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/wishlist_provider.dart';

class WishlistItem extends StatefulWidget {
  const WishlistItem(
      {required this.productName,
      required this.imagePath,
      required this.price,
      Key? key})
      : super(key: key);

  @override
  State<WishlistItem> createState() => _WishlistItemState();
  final String productName;
  final String imagePath;
  final int price;
}

class _WishlistItemState extends State<WishlistItem> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    WishListProvider wishListProvider = Provider.of<WishListProvider>(context);
    return SizedBox(
      width: double.maxFinite,
      height: 101,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: Image.network(widget.imagePath),
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.productName,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    Text(
                      '₹${widget.price.toString()}',
                      style: TextStyle(color: Colors.grey[800]),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        wishListProvider.deleteWishData(widget.productName);
                      },
                      icon: const Icon(Icons.delete),
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.zero,
                    ),
                    Container(
                      height: 40,
                      width: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextButton(
                          onPressed: () {
                            cartProvider.addCartData(
                                productName: widget.productName,
                                imagePath: widget.imagePath,
                                price: widget.price,
                                quantity: 1,
                                totalPrice: widget.price);
                            wishListProvider.deleteWishData(widget.productName);
                          },
                          child: const Text(
                            'Move To Cart',
                            style: TextStyle(fontSize: 11),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(
            height: 1,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
