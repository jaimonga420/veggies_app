import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../widgets/custom_appbar.dart';
import '../ui/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/profile-screen';

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    userProvider.getUserData();
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: const CustomAppBar(title: 'My Profile'),
      body: Stack(children: [
        Column(
          children: [
            Container(
              height: 100,
              color: AppColor.primaryColor,
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: const BoxDecoration(
                    color: AppColor.scaffoldColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userProvider.currentUserData!.userName,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(userProvider.getCurrentUserData!.userEmail)
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        singleItem(
                            Icons.shopping_basket_outlined, 'My Orders', () {}),
                        singleItem(
                            Icons.location_on_outlined, 'My Addresses', () {}),
                        singleItem(Icons.person, 'Refer A Friend', () {}),
                        singleItem(
                            Icons.file_copy, 'Terms & Conditions', () {}),
                        singleItem(
                            Icons.policy_outlined, 'Privacy Policy', () {}),
                        singleItem(Icons.add_chart_outlined, 'About', () {}),
                        singleItem(Icons.logout, 'Logout', () {}),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 40),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: AppColor.primaryColor,
            child: CircleAvatar(
              radius: 45,
              backgroundImage:
                  NetworkImage(userProvider.getCurrentUserData!.userImage),
              backgroundColor: AppColor.scaffoldColor,
            ),
          ),
        )
      ]),
    );
  }

  Widget singleItem(IconData icon, String title, Function onTap) {
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
