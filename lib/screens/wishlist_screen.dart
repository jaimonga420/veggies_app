import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/app_drawer.dart';
import '../providers/wishlist_provider.dart';
import '../models/cart_model.dart';
import '../widgets/wishlist_item.dart';
import '../ui/colors.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  static const routeName = '/wishlist-screen';

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of<WishListProvider>(context);
    wishListProvider.getWishData();
    List<CartModel> wishList = wishListProvider.getWishListItems;
    return Scaffold(
        backgroundColor: AppColor.scaffoldColor,
        appBar: const CustomAppBar(title: 'Your Wishlist'),
        drawer: const AppDrawer(),
        body: ListView.builder(
            itemCount: wishList.length,
            itemBuilder: (context, index) {
              return WishlistItem(
                  productName: wishList[index].productName,
                  imagePath: wishList[index].imagePath,
                  price: wishList[index].price);
            }));
  }
}
