import 'package:flutter/material.dart';

import '../ui/colors.dart';
import '../screens/search_screen.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: const [
          CartItem(),
          CartItem(),
          CartItem(),
          CartItem(),
        ],
      ),
      bottomNavigationBar: ListTile(
        title: const Text('Total Amount'),
        subtitle: const Text(
          '₹100',
          style: TextStyle(color: AppColor.primaryColor),
        ),
        trailing: SizedBox(
          width: 160,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
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
