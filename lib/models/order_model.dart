import './cart_model.dart';

class OrderModel {
  int orderNo;
  var orderItems;
  var orderAddress;
  String orderStatus;

  OrderModel({
    required this.orderAddress,
    required this.orderItems,
    required this.orderNo,
    required this.orderStatus,
  });
}
