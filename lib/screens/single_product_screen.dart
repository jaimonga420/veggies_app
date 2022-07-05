import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../ui/colors.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/homescreen/quantity_selector.dart';
import '../providers/wishlist_provider.dart';

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({Key? key}) : super(key: key);

  static const routeName = '/singleproductscreen';
  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  WishListProvider wishListProvider = WishListProvider();
  bool addedToWishlist = false;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    getAddedToWishlist() async {
      FirebaseFirestore.instance
          .collection('wishlists')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('userwishlist')
          .doc(routeArgs['productName'])
          .get()
          .then((value) => {
                if (mounted)
                  {
                    setState(() {
                      addedToWishlist = value.get('isAdded');
                    })
                  }
              });
    }

    getAddedToWishlist();
    return Scaffold(
      backgroundColor: const Color(0xffcbcbcb),
      appBar: const CustomAppBar(title: 'Veggies App'),
      bottomNavigationBar: Container(
        color: AppColor.primaryColor,
        height: 55,
        child: TextButton.icon(
            onPressed: () {
              setState(() {
                addedToWishlist = !addedToWishlist;
              });
              if (addedToWishlist) {
                wishListProvider.addWishData(
                    productName: routeArgs['productName'],
                    imagePath: routeArgs['imagePath'],
                    price: routeArgs['price']);
              } else if (addedToWishlist == false) {
                wishListProvider.deleteWishData(routeArgs['productName']);
              }
            },
            icon: addedToWishlist
                ? const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
            label: addedToWishlist
                ? const Text(
                    'Added To Wishlist',
                    style: TextStyle(color: Colors.white),
                  )
                : const Text(
                    'Add To Wishlist',
                    style: TextStyle(color: Colors.white),
                  )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 200,
                  width: 500,
                  child: Image.network(
                    routeArgs['imagePath'],
                    fit: BoxFit.contain,
                  )),
              Text(
                routeArgs['productName'],
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ultricies lobortis vestibulum. Sed porttitor diam eget dictum congue. Nulla hendrerit massa non porta vehicula. Cras vehicula scelerisque mi eget scelerisque.',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                ),
              ),
              quantitySelector('1Kg', routeArgs['price']),
            ],
          ),
        ]),
      ),
    );
  }

  Widget quantitySelector(String quan, int price) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String text;
    switch (quan) {
      case '500gm':
        text = '${(price * 0.5).round()} ';
        break;
      case '2Kg':
        text = '${(price * 2 * 0.9).round()} ';
        break;
      default:
        text = '$price';
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quan,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '₹$text',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          QuantitySelector(
              productName: routeArgs['productName'],
              imagePath: routeArgs['imagePath'],
              price: routeArgs['price']),
        ],
      ),
    );
  }
}
