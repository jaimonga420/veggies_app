import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/search_item.dart';
import '../ui/colors.dart';
import '../screens/cart_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static const routeName = '/search-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: const Icon(Icons.shopping_bag))
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView(
        children: [
          Container(
            height: 52,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 10, left: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search for an item',
                  suffixIcon: const Icon(Icons.search)),
            ),
          ),
          
        ],
      ),
    );
  }
}
