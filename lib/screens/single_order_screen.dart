import 'package:flutter/material.dart';

import '../models/order_model.dart';
import '../ui/colors.dart';
import '../widgets/order_item.dart';
import '../widgets/address_item.dart';

class SingleOrderScreen extends StatefulWidget {
  const SingleOrderScreen({Key? key}) : super(key: key);

  static const routeName = '/single-order-screen';

  @override
  State<SingleOrderScreen> createState() => _SingleOrderScreenState();
}

class _SingleOrderScreenState extends State<SingleOrderScreen> {
  @override
  Widget build(BuildContext context) {
    OrderModel orderData =
        ModalRoute.of(context)!.settings.arguments as OrderModel;

    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppColor.primaryColor,
        title: Text(
          'Order ID: ${orderData.orderId}',
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(25),
            child: Text(
              'Ordered Veggies',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: orderData.orderItems.length,
              itemBuilder: (context, index) {
                return OrderItem(
                    imagePath: orderData.orderItems[index]['imagepath'],
                    price: orderData.orderItems[index]['price'],
                    productName: orderData.orderItems[index]['productname'],
                    quantity: orderData.orderItems[index]['quantity'],
                    totalPrice: orderData.orderItems[index]['totalprice']);
              }),
          const Divider(
            height: 1,
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 40, left: 25, top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Amount',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    )),
                Text('₹${orderData.totalAmount.toString()}',
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primaryColor))
              ],
            ),
          ),
          const Divider(
            height: 1,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'Address',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          AddressItem(
              name: orderData.orderAddress[0]['name'],
              street: orderData.orderAddress[0]['street'],
              area: orderData.orderAddress[0]['area'],
              city: orderData.orderAddress[0]['city'],
              pincode: orderData.orderAddress[0]['pincode'],
              addressType: orderData.orderAddress[0]['addressType'],
              phone: orderData.orderAddress[0]['phone'],
              isFromOrderScreen: false),
          const Padding(
            padding: EdgeInsets.only(left: 25, top: 20),
            child: Text(
              'Order Status:-',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 25),
            child: Text(
              '${orderData.orderStatus} ',
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
