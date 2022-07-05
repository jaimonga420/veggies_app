import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> vegetables = [];
  List<ProductModel> fruits = [];
  List<ProductModel> allItems = [];

  fetchvegetables() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    ProductModel productModel;

    List<ProductModel> vegItems = [];

    for (var product in snapshot.docs) {
      productModel = ProductModel(
          productName: product['productname'],
          imagePath: product['imagepath'],
          category: product['category'],
          price: product['price']);
      vegItems.add(productModel);
    }
    vegetables = vegItems;
    notifyListeners();
  }

  fetchfruits() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('fruits').get();
    ProductModel productModel;

    List<ProductModel> fruitItems = [];

    for (var product in snapshot.docs) {
      productModel = ProductModel(
          productName: product['productname'],
          imagePath: product['imagepath'],
          category: product['category'],
          price: product['price']);
      fruitItems.add(productModel);
    }
    fruits = fruitItems;
    notifyListeners();
  }

  fetchAllItems() {
    allItems = List.from(vegetableslist)..addAll(fruitslist);
    return allItems;
  }

  List<ProductModel> get vegetableslist {
    return vegetables;
  }

  List<ProductModel> get fruitslist {
    return fruits;
  }

  List<ProductModel> get allItemsList {
    return allItems;
  }
}
