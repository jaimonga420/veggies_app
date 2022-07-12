import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/colors.dart';
import '../widgets/custom_textformfield.dart';
import '../providers/checkout_provider.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  static const routeName = '/add-address-screen';

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

// ignore: constant_identifier_names
enum Addresstypes { Home, Work }

class _AddAddressScreenState extends State<AddAddressScreen> {
  var myAddressType = Addresstypes.Home;
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController streetController = TextEditingController();
    TextEditingController areaController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController pincodeController = TextEditingController();
    CheckoutProvider checkoutProvider =
        Provider.of<CheckoutProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'Add New Address',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ElevatedButton(
          onPressed: () {
            checkoutProvider.addAddressData(
                nameController.text,
                int.parse(phoneController.text),
                streetController.text,
                areaController.text,
                cityController.text,
                int.parse(pincodeController.text),
                myAddressType.name,
                context);
          },
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.resolveWith<Size>(
                  (states) => const Size(double.maxFinite, 40))),
          child: const Text('Add Address'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            CustomTextFormField(
              label: 'Name',
              keyboardType: TextInputType.name,
              textEditingController: nameController,
            ),
            CustomTextFormField(
              label: 'Mobile Number',
              keyboardType: TextInputType.phone,
              textEditingController: phoneController,
              maxLength: 10,
            ),
            CustomTextFormField(
              label: 'H No./Street',
              keyboardType: TextInputType.streetAddress,
              textEditingController: streetController,
            ),
            CustomTextFormField(
              label: 'Area',
              keyboardType: TextInputType.streetAddress,
              textEditingController: areaController,
            ),
            CustomTextFormField(
              label: 'City',
              keyboardType: TextInputType.text,
              textEditingController: cityController,
            ),
            CustomTextFormField(
              label: 'Pincode',
              keyboardType: TextInputType.number,
              textEditingController: pincodeController,
              maxLength: 6,
            ),
            const ListTile(
              title: Text('Address Type'),
            ),
            RadioListTile(
              value: Addresstypes.Home,
              groupValue: myAddressType,
              onChanged: (value) {
                setState(() {
                  myAddressType = value as Addresstypes;
                });
              },
              title: const Text('Home'),
            ),
            RadioListTile(
              value: Addresstypes.Work,
              groupValue: myAddressType,
              onChanged: (value) {
                setState(() {
                  myAddressType = value as Addresstypes;
                });
              },
              title: const Text('Work'),
            )
          ],
        ),
      ),
    );
  }
}
