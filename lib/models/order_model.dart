class OrderModel {
  String orderId;
  List orderItems;
  List orderAddress;
  String orderStatus;
  double totalAmount;

  OrderModel({
    required this.orderId,
    required this.orderAddress,
    required this.orderItems,
    required this.orderStatus,
    required this.totalAmount,
  });
}
