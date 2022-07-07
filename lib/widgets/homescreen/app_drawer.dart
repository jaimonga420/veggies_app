import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/profile_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/cart_screen.dart';
import '../../screens/wishlist_screen.dart';
import '../../providers/user_provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    userProvider.getUserData();
    return Drawer(
      backgroundColor: const Color(0xffd6b738),
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 42,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        userProvider.getCurrentUserData!.userImage) 
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (userProvider.getCurrentUserData!.userName.isNotEmpty)
                      Text(
                        userProvider.getCurrentUserData!.userName,
                        style: const TextStyle(fontSize: 15),
                      ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                drawerItem(Icons.home_outlined, 'Home', () {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                }),
                drawerItem(Icons.shopping_bag_outlined, 'Cart', () {
                  Navigator.popAndPushNamed(context, CartScreen.routeName);
                }),
                drawerItem(Icons.account_circle_outlined, 'My Profile', () {
                  Navigator.popAndPushNamed(context, ProfileScreen.routeName);
                }),
                drawerItem(
                    Icons.notifications_outlined, 'Notifications', () {}),
                drawerItem(Icons.star_outline, 'Ratings & Reviews', () {}),
                drawerItem(Icons.shopping_basket_outlined, 'Wishlist', () {
                  Navigator.popAndPushNamed(context, WishlistScreen.routeName);
                }),
                drawerItem(
                    Icons.headphones_outlined, 'Raise A Complain', () {}),
                drawerItem(Icons.message_outlined, 'FAQs', () {}),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Contact Us',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Call us: +911234567890',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Write us at: contact@jaimonga420.me',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget drawerItem(IconData icon, String title, Function onTap) {
    return TextButton.icon(
        onPressed: () {
          onTap();
        },
        icon: Icon(
          icon,
          size: 32,
          color: Colors.black,
        ),
        label: Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),
        ));
  }
}
