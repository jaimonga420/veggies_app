import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ui/colors.dart';
import '../../providers/cart_provider.dart';
import '../../models/cart_model.dart';

class QuantitySelector extends StatefulWidget {
  QuantitySelector(
      {required this.productName,
      required this.imagePath,
      required this.price,
      Key? key})
      : super(key: key);

  String productName;
  String imagePath;
  int price;

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;
  bool isAdded = false;
  late int totalPrice;

  quantityChecker() {
    FirebaseFirestore.instance
        .collection('carts')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('usercart')
        .doc(widget.productName)
        .get()
        .then((value) => {
              if (mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        isAdded = value.get('isAdded');
                        quantity = value.get('quantity');
                      })
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    quantityChecker();
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartItems();
    return Container(
      height: 35,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: isAdded
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  padding: const EdgeInsets.only(right: 7),
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    if (quantity == 1) {
                      setState(() {
                        isAdded = false;
                        cartProvider.deleteCartItem(widget.productName);
                      });
                    } else {
                      setState(() {
                        quantity--;
                      });
                      cartProvider.addCartData(
                          productName: widget.productName,
                          price: widget.price,
                          imagePath: widget.imagePath,
                          quantity: quantity,
                          totalPrice: quantity * widget.price);
                    }
                  },
                  icon: const Icon(Icons.remove),
                  color: AppColor.iconColor,
                  iconSize: 18,
                ),
                Center(
                  child: Text(
                    quantity.toString(),
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                IconButton(
                  padding: const EdgeInsets.only(left: 7),
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                    cartProvider.addCartData(
                        productName: widget.productName,
                        price: widget.price,
                        imagePath: widget.imagePath,
                        quantity: quantity,
                        totalPrice: quantity * widget.price);
                  },
                  icon: const Icon(Icons.add),
                  color: AppColor.iconColor,
                  iconSize: 18,
                ),
              ],
            )
          : Center(
              child: TextButton(
                  onPressed: () {
                    cartProvider.addCartData(
                        productName: widget.productName,
                        price: widget.price,
                        imagePath: widget.imagePath,
                        quantity: quantity,
                        totalPrice: quantity * widget.price);
                    setState(() {
                      isAdded = true;
                      debugPrint(isAdded.toString());
                    });
                  },
                  child: Text('Add')),
            ),
    );
  }
}
