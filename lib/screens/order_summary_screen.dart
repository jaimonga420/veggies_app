import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/colors.dart';
import '../models/cart_model.dart';
import '../providers/cart_provider.dart';
import '../widgets/address_item.dart';
import '../widgets/order_item.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({Key? key}) : super(key: key);

  static const routeName = '/order-summary-screen';

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

enum PaymentOptionstype { cod }

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  var paymentOption = PaymentOptionstype.cod;
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    List<CartModel> cartItemsList = cartProvider.getcartItemsList();
    return Scaffold(
        backgroundColor: AppColor.scaffoldColor,
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: AppColor.primaryColor,
          title: const Text(
            'Order Summary',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: ListTile(
          title: const Text(
            'Total Amount',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '₹${cartProvider.getTotalCartValue}',
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor),
          ),
          trailing: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => AppColor.primaryColor),
                shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                fixedSize: MaterialStateProperty.resolveWith(
                    (states) => const Size(200, 40))),
            child: const Text('Place Order'),
          ),
        ),
        body: ListView(
          children: [
            const AddressItem(
              title: 'Jai Monga',
              address: 'Street No.14, Preet Nagar, Begu Road, Sirsa - 125055',
              addressType: 'Home',
              phoneNumber: 7015896339,
              isFromOrderScreen: true,
            ),
            const Divider(
              height: 1,
            ),
            ExpansionTile(title: const Text('Products'), children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cartItemsList.length,
                  itemBuilder: (context, index) {
                    return OrderItem(
                      imagePath: cartItemsList[index].imagePath,
                      price: cartItemsList[index].price,
                      productName: cartItemsList[index].productName,
                      quantity: cartItemsList[index].quantity,
                      totalPrice: cartItemsList[index].totalPrice,
                    );
                  })
            ]),
            const Padding(
              padding:  EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Select Payment Method',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ),
            RadioListTile(
              value: PaymentOptionstype.cod,
              groupValue: paymentOption,
              onChanged: (value) {
                setState(() {
                  paymentOption = value as PaymentOptionstype;
                });
              },
              title: const Text('COD'),
            )
          ],
        ));
  }
}
