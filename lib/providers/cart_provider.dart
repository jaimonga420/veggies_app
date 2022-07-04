import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> cartItemsList = [];

  void addCartData({
    required productName,
    required imagePath,
    required price,
    required quantity,
    required totalPrice,
  }) async {
    FirebaseFirestore.instance
        .collection('carts')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('usercart')
        .doc(productName)
        .set({
      'productName': productName,
      'imagePath': imagePath,
      'price': price,
      'quantity': quantity,
      'totalprice': totalPrice,
      'isAdded': true,
    });
  }

  void getCartItems() async {
    List<CartModel> localCartList = [];
    QuerySnapshot<Map<String, dynamic>> cartItems = await FirebaseFirestore
        .instance
        .collection('carts')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('usercart')
        .get();

    for (var item in cartItems.docs) {
      CartModel cartModel = CartModel(
          productName: item.get('productName'),
          imagePath: item.get('imagePath'),
          price: item.get('price'),
          quantity: item.get('quantity'),
          totalPrice: item.get('totalprice'));

      localCartList.add(cartModel);
    }
    cartItemsList = localCartList;
    notifyListeners();
  }

  void deleteCartItem(String productName) async {
    FirebaseFirestore.instance
        .collection('carts')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('usercart')
        .doc(productName)
        .delete();
    notifyListeners();
  }

  List<CartModel> getcartItemsList() {
    return cartItemsList;
  }
}
