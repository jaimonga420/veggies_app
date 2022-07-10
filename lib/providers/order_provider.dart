import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/order_model.dart';

class OrderProvider with ChangeNotifier {
  late int orderNo;
  List ordersList = [];

  void addOrderData(
    var orderItems,
    var orderAddress,
    String orderStatus,
  ) async {
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('userorders')
        .doc()
        .set({
      'orderno': orderNo,
      'orderItems': orderItems,
      'orderAddress': orderAddress,
      'orderstatus': orderStatus,
    });
    notifyListeners();
  }

  void getOrderItems() async {
    List localOrdersList = [];
    QuerySnapshot? orderData = await FirebaseFirestore.instance
        .collection('orders')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('userorders')
        .get();

    for (var item in orderData.docs) {
      OrderModel orderModel = OrderModel(
          orderAddress: item.get('orderAddress'),
          orderItems: item.get('orderItems'),
          orderNo: item.get('orderno'),
          orderStatus: item.get('orderstatus'));
      localOrdersList.add(orderModel);
    }
    if (localOrdersList.isEmpty) {
      orderNo = 1;
    } else {
      orderNo = localOrdersList.length++;
    }
    notifyListeners();
  }
}
