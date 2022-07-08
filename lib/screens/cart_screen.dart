import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/colors.dart';
import '../screens/search_screen.dart';
import '../widgets/cart_item.dart';
import '../providers/cart_provider.dart';
import '../models/cart_model.dart';
import '../screens/address_screen.dart';
import '../providers/checkout_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartItems();
    cartProvider.setTotalCartValue();
    List<CartModel> cartItemsList = cartProvider.getcartItemsList();
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SearchScreen.routeName);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
          itemCount: cartItemsList.length,
          itemBuilder: ((context, index) {
            return CartItem(
                imagePath: cartItemsList[index].imagePath,
                price: cartItemsList[index].price,
                productName: cartItemsList[index].productName,
                quantity: cartItemsList[index].quantity,
                totalPrice: cartItemsList[index].totalPrice);
          })),
      bottomNavigationBar: ListTile(
        title: const Text('Total Amount'),
        subtitle: Text(
          '₹${cartProvider.getTotalCartValue}',
          style: const TextStyle(
              color: AppColor.primaryColor, fontWeight: FontWeight.w600),
        ),
        trailing: SizedBox(
          width: 160,
          child: ElevatedButton(
            onPressed: cartItemsList.isEmpty
                ? null
                : () {
                    Navigator.of(context).pushNamed(AddressScreen.routeName);
                  },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => cartItemsList.isEmpty
                        ? Colors.grey
                        : AppColor.primaryColor),
                shape: MaterialStateProperty.resolveWith((states) =>
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)))),
            child: const Text('Checkout'),
          ),
        ),
      ),
    );
  }
}
