import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/colors.dart';
import '../screens/search_screen.dart';
import '../screens/cart_screen.dart';
import '../models/product_model.dart';
import '../providers/product_provider.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomAppBar({required this.title, Key? key}) : super(key: key);

  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context).fetchAllItems();
    List<ProductModel> allItems =
        Provider.of<ProductProvider>(context).allItemsList;
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: AppColor.primaryColor,
      title: Text(
        widget.title,
        style: const TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) =>
                      SearchScreen(allItemsList: allItems))));
            },
            icon: const Icon(Icons.search)),
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            icon: const Icon(Icons.shopping_bag))
      ],
    );
  }
}
