import 'package:flutter/material.dart';

import '../ui/colors.dart';

class AddressItem extends StatelessWidget {
  const AddressItem(
      {required this.title,
      required this.address,
      required this.addressType,
      required this.phoneNumber,
      required this.isFromOrderScreen,
      Key? key})
      : super(key: key);

  final String title;
  final String address;
  final int phoneNumber;
  final String addressType;
  final bool isFromOrderScreen;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ListTile(
            leading: isFromOrderScreen
                ? null
                : const Radio(
                    value: false,
                    onChanged: null,
                    groupValue: null,
                  ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
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
                Text(address),
                const SizedBox(
                  height: 3,
                ),
                Text(phoneNumber.toString())
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
