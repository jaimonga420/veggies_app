import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../models/product_model.dart';
import '../widgets/search_item.dart';
import '../ui/colors.dart';
import '../screens/cart_screen.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  SearchScreen({required this.allItemsList, Key? key}) : super(key: key);

  final List<ProductModel> allItemsList;
  static const routeName = '/search-screen';
  String query = '';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  searchItemFn(String query) {
    List<ProductModel> returnSearchItem = widget.allItemsList
        .where((item) => item.productName.toLowerCase().contains(query))
        .toList();
    return returnSearchItem;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> queriedSearchItems = searchItemFn(widget.query);
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
      body: Column(
        children: [
          Container(
            height: 52,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: TextFormField(
              onChanged: ((value) {
                setState(() {
                  widget.query = value;
                });
              }),
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
          Expanded(
            child: ListView.builder(
                itemCount: queriedSearchItems.length,
                itemBuilder: ((context, index) {
                  return SearchItem(
                      productName: queriedSearchItems[index].productName,
                      imagePath: queriedSearchItems[index].imagePath,
                      price: queriedSearchItems[index].price);
                })),
          )
        ],
      ),
    );
  }
}
