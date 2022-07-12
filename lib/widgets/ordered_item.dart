import 'package:flutter/material.dart';

import '../models/order_model.dart';

class OrderedItem extends StatefulWidget {
  const OrderedItem({required this.orderData, Key? key}) : super(key: key);

  final OrderModel orderData;

  @override
  State<OrderedItem> createState() => _OrderedItemState();
}

class _OrderedItemState extends State<OrderedItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 100,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 83,
            width: 83,
            child: Image.network(
              widget.orderData.orderItems[0]['imagepath'],
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 83,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order ID : ${widget.orderData.orderId}'),
                Text('No. of items: ${widget.orderData.orderItems.length} '),
                Text('Amount: ₹${widget.orderData.totalAmount}'),
                Text(widget.orderData.orderStatus),
              ],
            ),
          ),
          SizedBox(
            height: 83,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
          )
        ],
      ),
    );
  }
}
