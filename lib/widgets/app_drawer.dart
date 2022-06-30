import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';
import '../screens/home_screen.dart';
import '../screens/cart_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffd6b738),
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 42,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/vegi.png'),
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
                      'Welcome Guest',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
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
                  Navigator.popAndPushNamed(context, HomeScreen.routeName);
                }),
                drawerItem(Icons.shopping_bag_outlined, 'Cart', () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                }),
                drawerItem(Icons.account_circle_outlined, 'My Profile', () {
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                }),
                drawerItem(
                    Icons.notifications_outlined, 'Notifications', () {}),
                drawerItem(Icons.star_outline, 'Ratings & Reviews', () {}),
                drawerItem(Icons.shopping_basket_outlined, 'Wishlist', () {}),
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
