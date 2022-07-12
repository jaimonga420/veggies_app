import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/order_model.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> ordersList = [];
  final _chars = '1234567890';
  final Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  void addOrderData(
    var orderItems,
    var orderAddress,
    String orderStatus,
    double totalAmount,
  ) async {
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('userorders')
        .doc(getRandomString(11))
        .set({
          'totalAmount' : totalAmount,
      'orderItems': orderItems,
      'orderAddress': orderAddress,
      'orderstatus': orderStatus,
    });
    notifyListeners();
  }

  void getOrderItems() async {
    List<OrderModel> localOrdersList = [];
    QuerySnapshot orderData = await FirebaseFirestore.instance
        .collection('orders')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('userorders')
        .get();

    for (var item in orderData.docs) {
      OrderModel orderModel = OrderModel(
          orderId: item.reference.id,
          totalAmount: item.get('totalAmount'),
          orderAddress: item.get('orderAddress'),
          orderItems: item.get('orderItems'),
          orderStatus: item.get('orderstatus'));
      localOrdersList.add(orderModel);
    }
    ordersList = localOrdersList;
    notifyListeners();
  }

  List<OrderModel> get orderListGetter {
    return ordersList;
  }
}
