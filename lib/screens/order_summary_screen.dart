import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/colors.dart';
import '../models/cart_model.dart';
import '../providers/cart_provider.dart';
import '../widgets/address_item.dart';
import '../widgets/order_item.dart';
import '../providers/order_provider.dart';
import '../screens/home_screen.dart';

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
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    orderProvider.getOrderItems();
    List<CartModel> cartItemsList = cartProvider.getcartItemsList();
    List addressItemsList = ModalRoute.of(context)!.settings.arguments as List;

    var productNamesList = {
      for (var i in cartItemsList) i.productName,
    };

    var orderAddress = {
      for (var i in addressItemsList)
        {
          'name': i.name,
          'phone': i.phone,
          'street': i.street,
          'area': i.area,
          'city': i.city,
          'pincode': i.pincode,
          'addressType': i.addressType,
        }
    }.toList();
    var orderItems = {
      for (var i in cartItemsList)
        {
          'productname': i.productName,
          'price': i.price,
          'imagepath': i.imagePath,
          'quantity': i.quantity,
          'totalprice': i.totalPrice
        }
    }.toList();
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
            onPressed: () {
              orderProvider.addOrderData(
                  orderItems, orderAddress, 'processing');
              cartProvider.deleteCart(productNamesList);
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            },
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: ListView.builder(
                  itemCount: addressItemsList.length,
                  itemBuilder: ((context, index) {
                    return AddressItem(
                        name: addressItemsList[index].name,
                        street: addressItemsList[index].street,
                        area: addressItemsList[index].area,
                        city: addressItemsList[index].city,
                        pincode: addressItemsList[index].pincode,
                        addressType: addressItemsList[index].addressType,
                        phone: addressItemsList[index].phone,
                        isFromOrderScreen: true);
                  })),
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
              padding: EdgeInsets.only(left: 20, top: 20),
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
