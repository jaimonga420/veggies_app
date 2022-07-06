import 'package:flutter/material.dart';

import '../ui/colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/address_item.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  static const routeName = '/address-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: CustomAppBar(title: 'Delivery Address'),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.resolveWith<Size>(
                  (states) => Size(double.maxFinite, 40))),
          child: Text('Proceed To Checkout'),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Deliver To'),
            leading: Image.asset('assets/images/location.png'),
          ),
          const Divider(
            height: 1,
          ),
          Column(
            children: [
              AddressItem(
                  title: 'Jai Monga',
                  address:
                      'Street No.14, Preet Nagar, Begu Road, Sirsa - 125055',
                  addressType: 'Home',
                  phoneNumber: 7015896339)
            ],
          )
        ],
      ),
    );
  }
}
