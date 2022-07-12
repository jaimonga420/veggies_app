import 'package:flutter/material.dart';

import '../ui/colors.dart';

class AddressItem extends StatelessWidget {
  const AddressItem(
      {required this.name,
      required this.street,
      required this.area,
      required this.city,
      required this.pincode,
      required this.addressType,
      required this.phone,
      required this.isFromOrderScreen,
      Key? key})
      : super(key: key);

  final String name;
  final String street;
  final String area;
  final String city;
  final int pincode;
  final int phone;
  final String addressType;
  final bool isFromOrderScreen;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                if (isFromOrderScreen == false)
                  Container(
                    padding: const EdgeInsets.all(1),
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Text(
                        addressType,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),
              ],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(street),
                Text(area),
                Text(city),
                Text(pincode.toString()),
                const SizedBox(
                  height: 3,
                ),
                Text(phone.toString())
              ],
            ),
          ),
        ),
        const Divider(
          height: 1,
        )
      ],
    );
  }
}
