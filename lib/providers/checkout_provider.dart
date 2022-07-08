import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/address_model.dart';

class CheckoutProvider with ChangeNotifier {
  List<AddressModel> addressList = [];
  void getAddressItems() async {
    List<AddressModel> localAddressList = [];
    QuerySnapshot<Map<String, dynamic>> addressItems =
        await FirebaseFirestore.instance.collection('addresses').get();

    for (var item in addressItems.docs) {
      AddressModel addressModel = AddressModel(
          name: item.get('name'),
          phone: item.get('phone'),
          street: item.get('street'),
          area: item.get('area'),
          city: item.get('city'),
          pincode: item.get('pincode'),
          addressType: item.get('addresstype'));
      localAddressList.add(addressModel);
    }

    addressList = localAddressList;
    notifyListeners();
  }

  void addAddressData(
      String name,
      int phone,
      String street,
      String area,
      String city,
      int pincode,
      String addressType,
      BuildContext context) async {
    if (name.isEmpty ||
        phone.isNaN ||
        street.isEmpty ||
        area.isEmpty ||
        city.isEmpty ||
        pincode.isNaN) {
      const errorSnackbar = SnackBar(content: Text('All fields are required.'));
      ScaffoldMessenger.of(context).showSnackBar(errorSnackbar);
    } else {
      await FirebaseFirestore.instance
          .collection('addresses')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'name': name,
        'phone': phone,
        'street': street,
        'area': area,
        'city': city,
        'pincode': pincode,
        'addresstype': addressType,
      }).then((value) => Navigator.of(context).pop());
    }
    notifyListeners();
  }

  List<AddressModel> get addressListGetter {
    return addressList;
  }
}
