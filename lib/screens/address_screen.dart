import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/colors.dart';
import '../providers/checkout_provider.dart';
import '../widgets/address_item.dart';
import './add_address_screen.dart';
import './order_summary_screen.dart';
import '../models/address_model.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  static const routeName = '/address-screen';

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    checkoutProvider.getAddressItems();
    List<AddressModel> addressItemsList = checkoutProvider.addressListGetter;
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'Delivery Address',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AddAddressScreen.routeName);
          },
          child: addressItemsList.isEmpty
              ? const Icon(Icons.add)
              : const Icon(Icons.edit)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(OrderSummaryScreen.routeName,
                arguments: addressItemsList);
          },
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.resolveWith<Size>(
                  (states) => Size(double.maxFinite, 40))),
          child: const Text('Proceed To Checkout'),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Deliver To'),
            leading: Image.asset('assets/images/location.png'),
          ),
          const Divider(
            height: 1,
          ),
          addressItemsList.isEmpty
              ? Center(
                  child: Text('Please add a delivery address.'),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: addressItemsList.length,
                  itemBuilder: (context, index) {
                    return AddressItem(
                        name: addressItemsList[index].name,
                        street: addressItemsList[index].street,
                        area: addressItemsList[index].area,
                        city: addressItemsList[index].city,
                        pincode: addressItemsList[index].pincode,
                        addressType: addressItemsList[index].addressType,
                        phone: addressItemsList[index].phone,
                        isFromOrderScreen: false);
                  })
        ],
      ),
    );
  }
}
