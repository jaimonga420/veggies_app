import 'package:flutter/cupertino.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/cart_model.dart';

class WishListProvider with ChangeNotifier {
  List<CartModel> wishlistItems = [];
  void addWishData({
    required productName,
    required imagePath,
    required price,
  }) {
    FirebaseFirestore.instance
        .collection('wishlists')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('userwishlist')
        .doc(productName)
        .set({
      'productName': productName,
      'imagePath': imagePath,
      'price': price,
      'isAdded': true,
    });
    notifyListeners();
  }

  void deleteWishData(String productName) {
    FirebaseFirestore.instance
        .collection('wishlists')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('userwishlist')
        .doc(productName)
        .delete();
    notifyListeners();
  }

  getWishData() async {
    List<CartModel> localWishList = [];
    QuerySnapshot<Map<String, dynamic>> wishItems = await FirebaseFirestore
        .instance
        .collection('wishlists')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('userwishlist')
        .get();

    for (var item in wishItems.docs) {
      CartModel wishModel = CartModel(
          productName: item.get('productName'),
          imagePath: item.get('imagePath'),
          price: item.get('price'),
          quantity: 1,
          totalPrice: 1);
      localWishList.add(wishModel);
    }
    wishlistItems = localWishList;
    notifyListeners();
  }

 

  List<CartModel> get getWishListItems {
    return wishlistItems;
  }
}
